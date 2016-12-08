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
    
    private var _email: String?
    private var _password: String?
    
    var email: String? {
        get {
            return _email
        } set {
            _email = newValue
        }
    }
    
    var password: String? {
        get {
            return _password
        } set {
            _password = newValue
        }
    }
    
    var isSignedIn: Bool {
        if FIRAuth.auth()?.currentUser != nil {
            return true
        }
        
        return false
    }
    
    func create() throws {
        guard let _email = _email, !_email.isEmpty else {
            throw Validation.invalidEmail
        }
        
        guard let _password = _password, !_password.isEmpty else {
            throw Validation.invalidPassword
        }
        
        uploadToServer(withEmail: _email, password: _password)
        
    }
    
    private func uploadToServer(withEmail email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print("Unable to create user: \(error)")
            }
        })
    }
}
