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

class AuthVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: CustomField!
    @IBOutlet weak var passwordField: CustomField!
    @IBOutlet weak var submitButton: CustomButton!
    
    var newUser = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let email = emailField.text, email.isEmpty == false else {
            displayAlert(title: "Invalid Email", message: "Please enter a email address")
            return
        }
        
        guard let password = passwordField.text, password.isEmpty == false else {
            displayAlert(title: "Invalid Password", message: "Please enter a password")
            return
        }

        if newUser {
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    self.displayAlert(title: "Error", message: error.localizedDescription)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            
        } else {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    self.displayAlert(title: "Error", message: error.localizedDescription)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            })
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
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

























