//
//  MessageCell.swift
//  Smack
//
//  Created by Николай Маторин on 09.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configureCell(message: Message) {
        messageLbl.text = message.messageBody
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = dateFormatter.date(from: message.timeStamp) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            dateFormatter.locale = Locale.current
            timeStampLbl.text = dateFormatter.string(from: parsedDate)
        }
    }
}
