//
//  ProfileSketchCell.swift
//  Drawing
//
//  Created by James Brown on 12/10/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import FirebaseStorage

class ProfileSketchCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(imgUrl: String) {
        let ref = FIRStorage.storage().reference(forURL: imgUrl)
        
        ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
            if error != nil {
                print("Unable to download sketch from firebase storage")
                return
            }
            
            if let imgData = data {
                let img = UIImage(data: imgData)
                self.imageView.image = img
            }
        })
    }
}
