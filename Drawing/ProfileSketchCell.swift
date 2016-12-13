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
        Sketches().downloadImageTo(imageView: imageView, url: imgUrl)
        
    }
}
