//
//  SketchCell.swift
//  Drawing
//
//  Created by James Brown on 12/15/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class SketchCell: UITableViewCell {
    @IBOutlet weak var dateLl: UILabel!
    @IBOutlet var sketchImageView: UIImageView!
    @IBOutlet weak var customView: CustomView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // this line makes the custom view expand with the cell. the aspect ratio and the top and bottom constraints make this possible
        customView.frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
    }
}
