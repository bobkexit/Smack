//
//  MessageService.swift
//  Smack
//
//  Created by Николай Маторин on 08.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var unreadChannels = [String]()
    var selectedChannel: Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearChannels()
                guard let data = response.data else { return }
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                } catch let error {
                    completion(false)
                    debugPrint(error as Any)
                }
                
//                if let json = try! JSON(data: data).array {
//                    for item in json {
//                        let name = item["name"].stringValue
//                        let description = item["description"].stringValue
//                        let id = item["_id"].stringValue
//                        
//                        let channel = Channel(title: name, description: description, id: id)
//                        self.channels.append(channel)
//                    }
//                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearMessages() {
        messages.removeAll()
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_MEASSAGES)/\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else { return }
                do {
                    self.messages = try JSONDecoder().decode([Message].self, from: data)
                    
                    print(self.messages)
                    completion(true)
                } catch let error {
                    debugPrint(error as Any)
                    completion(false)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
