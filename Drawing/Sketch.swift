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
    private var _brushWidth: CGFloat = 3
    private var _isErasing = false
    
    private var _previousColor: UIColor?

    
    var color: UIColor {
        get {
            return _color
        } set {
            _color = newValue
        }
    }
    
    var brushWidth: CGFloat {
        get {
            return _brushWidth
        } set {
            _brushWidth = newValue
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
    
    func drawPointsWith(imageView: UIImageView, fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(_brushWidth)
        context?.setStrokeColor(_color.cgColor)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
}
