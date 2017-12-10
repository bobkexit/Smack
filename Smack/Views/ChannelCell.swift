//
//  ChannelCell.swift
//  Smack
//
//  Created by Николай Маторин on 08.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var channelName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.name ?? ""
        channelName.text = "#\(title)"
        channelName.font = UIFont(name: "\(DEFAULT_FONT)-Regular", size: DEFAULT_FONT_SIZE)
        
        for id in MessageService.instance.unreadChannels {
            if id == channel._id {
                channelName.font = UIFont(name: "\(DEFAULT_FONT)-Bold", size: 22)
            }
        }
    }
}
