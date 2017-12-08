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
}
