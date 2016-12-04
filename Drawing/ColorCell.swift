//
//  ColorCell.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = self.contentView.frame.size.height / 2
    }
}
