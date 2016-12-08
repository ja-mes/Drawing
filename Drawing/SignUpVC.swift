//
//  SignUpVC.swift
//  Drawing
//
//  Created by James Brown on 12/7/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {
    @IBOutlet weak var emailField: CustomField!
    @IBOutlet weak var passwordField: CustomField!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
    }
    

}
