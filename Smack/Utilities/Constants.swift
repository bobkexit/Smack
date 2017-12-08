//
//  Constants.swift
//  Smack
//
//  Created by Николай Маторин on 06.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Succses: Bool) -> ()

// URL Constants
let BASE_URL = "https://smackchat178.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"

// Socket events
let SOCKET_EVT_NEW_CHANNEL = "newChannel"
let SOCKET_EVT_CHANNEL_CREATED = "channelCreated"


// Colors
let SMACK_PURPLE_PLACEHOLDER = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

// Notification constants
let NOTIF_USER_DATA_DID_CHANGED = Notification.Name("notifUserDataDidChanged")


// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_AVATAR_PICKER = "toAvatarPicker"

let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]



