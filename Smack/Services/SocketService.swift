//
//  SocketService.swift
//  Smack
//
//  Created by Николай Маторин on 08.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    //var socket: SocketIOClient
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    
    func establishConnection() {
        manager.defaultSocket.connect()
    }
    
    func closeConnection() {
        manager.defaultSocket.disconnect()
    }
    
    func addChanel(name: String, description: String, completion: @escaping CompletionHandler) {
        manager.defaultSocket.emit(SOCKET_EVT_NEW_CHANNEL, name, description)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        manager.defaultSocket.on(SOCKET_EVT_CHANNEL_CREATED) { (dataArray, ack) in
            guard let name = dataArray[0] as? String else { return }
            guard let description = dataArray[1] as? String else { return }
            guard let id = dataArray[2] as? String else { return }

            let newChannel = Channel(_id: id, name: name, description: description, __v: nil)

            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(message: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        manager.defaultSocket.emit(SOCKET_EVT_NEW_MESSAGE, message, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getMessage(completion: @escaping (_ newMassage: Message) -> Void) {
        manager.defaultSocket.on(SOCKET_EVT_MESSAGE_CREATED) { (dataArray, ack) in
            guard let message = dataArray[0] as? String else { return }
            guard let userId = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
          
            let newMessage = Message(_id: id, messageBody: message, userId: userId, channelId: channelId, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, __v: nil, timeStamp: timeStamp)
            
            //MessageService.instance.messages.append(newMessage)
            completion(newMessage)
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        manager.defaultSocket.on(SOCKET_EVT_USER_TYPING_UPD) { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            completionHandler(typingUsers)
        }
    }
}
