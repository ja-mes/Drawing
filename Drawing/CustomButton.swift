//
//  RoundedButton.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    @IBInspectable var cornerRadius: Double = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
