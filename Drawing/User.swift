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
    enum Validation: Error {
        case invalidEmail
        case invalidPassword
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
    
    func authUser(withEmail email: String?, password: String?, newUser: Bool = false) throws {
        guard let email = email, !email.isEmpty else {
            throw Validation.invalidEmail
        }
        
        guard let password = password, !password.isEmpty else {
            throw Validation.invalidPassword
        }

        
        if newUser {
            saveToFirebase(withEmail: email, password: password)
        } else {
            
        }
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
