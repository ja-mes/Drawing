//
//  SignUpVC.swift
//  Drawing
//
//  Created by James Brown on 12/7/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: CustomField!
    @IBOutlet weak var passwordField: CustomField!
    @IBOutlet weak var submitButton: CustomButton!
    
    var user: User!
    var newUser = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if newUser {
            do {
                try currentUser.authUser(withEmail: emailField.text, password: passwordField.text, newUser: true)
                dismiss(animated: true , completion: nil)
            } catch User.Validation.invalidEmail {
                print("user entered a invalid email")
            } catch User.Validation.invalidPassword {
                print("user entered a invalid password")
            } catch {
                fatalError()
            }
        } else {
            do {
                
            }
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if newUser {
            newUser = false
            
            titleLabel.text = "Log in to your account"
            submitButton.setTitle("Log In", for: .normal)
        } else {
            newUser = true
            
            titleLabel.text = "Create an account"
            submitButton.setTitle("Sign Up", for: .normal)
        }
    }

}
