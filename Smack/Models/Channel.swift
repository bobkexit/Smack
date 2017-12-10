//
//  Channel.swift
//  Smack
//
//  Created by Николай Маторин on 08.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import Foundation

//struct Channel {
//    public private(set) var title: String!
//    public private(set) var description: String!
//    public private(set) var id: String!
//}

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?
}
