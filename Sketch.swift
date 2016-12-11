//
//  Sketch.swift
//  Drawing
//
//  Created by James Brown on 12/11/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Sketch {
    var image: UIImage
    
    lazy var database = FIRDatabase.database().reference()
    lazy var storeage = FIRStorage.storage().reference()
    lazy var auth = FIRAuth.auth()
    
    init(img: UIImage) {
        image = img
    }
    
    
    func save() {
        if let imgData = UIImageJPEGRepresentation(image, 0.2) {
            let imgUid = NSUUID().uuidString
            let ref = storeage.child("sketches")
            let metadata = FIRStorageMetadata()
            metadata.contentType = "image/jpeg"
            
            ref.child(imgUid).put(imgData, metadata: metadata, completion: { (metadata, error) in
                if let error = error {
                    print("Unable to upload image to firebase storeage: \(error)")
                }
                
                if let url = metadata?.downloadURL()?.absoluteString {
                    self.saveToFirDB(imgUrl: url)
                }
            })
        }
    }
    
    private func saveToFirDB(imgUrl: String) {
        if let userId = auth?.currentUser?.uid {
            let sketch = database.child("sketches").childByAutoId()
            
            sketch.setValue([
                "imgUrl": imgUrl,
                "user": userId
            ])
        }
    }
    
}
