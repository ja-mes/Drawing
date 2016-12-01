//
//  Sketch.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class Sketch {
    private var _color = UIColor.black
    private var _isErasing = false
    
    private var _previousColor: UIColor?

    
    var color: UIColor {
        get {
            return _color
        } set {
            _color = newValue
        }
    }
    
    var isErasing: Bool {
        return _isErasing
    }
    
    
    func toggleEraser() {
        
        if _isErasing {
            _isErasing = false
            
            if let _previousColor = _previousColor {
                _color = _previousColor
            } else {
                _color = UIColor.black
            }
        } else {
            _isErasing = true
            
            _previousColor = _color
            _color = UIColor.white
        }
    }
}
