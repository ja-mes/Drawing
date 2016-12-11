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
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.3
    }
    
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
