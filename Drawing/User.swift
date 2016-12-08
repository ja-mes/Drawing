//
//  User.swift
//  Drawing
//
//  Created by James Brown on 12/7/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class User {
    private var _errorMessage: String?
    
    var errorMessage: String? {
        return _errorMessage
    }
    
    var email: String? {
        return FIRAuth.auth()?.currentUser?.email
    }
    
    
    var isSignedIn: Bool {
        if FIRAuth.auth()?.currentUser != nil {
            return true
        }
        
        return false
    }
    
    func authUser(withEmail email: String?, password: String?, newUser: Bool = false) -> Bool {
        guard let email = email, !email.isEmpty else {
            _errorMessage = "Email address is invalid"
            return false
        }
        
        guard let password = password, !password.isEmpty else {
            _errorMessage = "Password is invalid"
            return false
        }

        
        if newUser {
            saveToFirebase(withEmail: email, password: password)
        } else {
            
        }
        
        return true
    }
    
    func signOut() {
        try! FIRAuth.auth()?.signOut()
    }
    
    private func saveToFirebase(withEmail email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print("Unable to create user: \(error)")
            }
        })
    }
    
    private func loginWithFirebase(withEmail email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print("Unable to authenticate user: \(error)")
            }
        })
    }
}
