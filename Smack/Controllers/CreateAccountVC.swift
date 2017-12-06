//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Николай Маторин on 06.12.2017.
//  Copyright © 2017 Николай Маторин. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
