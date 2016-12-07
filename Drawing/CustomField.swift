//
//  CustomField.swift
//  Drawing
//
//  Created by James Brown on 12/7/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

@IBDesignable class CustomField: UITextField {
    @IBInspectable var textPadding: CGFloat = 0 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: textPadding, height: frame.height))
            leftView = paddingView
            leftViewMode = UITextFieldViewMode.always
        }
    }
}
