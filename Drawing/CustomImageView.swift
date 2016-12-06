//
//  CustomImageView.swift
//  Drawing
//
//  Created by James Brown on 12/6/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

@IBDesignable class CustomImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
