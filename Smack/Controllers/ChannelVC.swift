//
//  ChannelVC.swift
//  Smack
//
//  Created by Николай Маторин on 06.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

}
