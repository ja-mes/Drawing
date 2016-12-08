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
    
    func create(withEmail email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                print("Unable to create user: \(error)")
                return
            }
        })
    }
}
