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
    
    func create(withEmail email: String?, password: String?) throws {
        guard let email = email, !email.isEmpty else {
            throw Validation.invalidEmail
        }
        
        guard let password = password, !password.isEmpty else {
            throw Validation.invalidPassword
        }
        
        uploadToServer(withEmail: email, password: password)
        
    }
    
    func signOut() {
        try! FIRAuth.auth()?.signOut()
    }
    
    private func uploadToServer(withEmail email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print("Unable to create user: \(error)")
            }
        })
    }
}
