//
//  Sketch.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit


class SketchPad {
    private var _imageView: UIImageView
    private var _previousColor: UIColor?
    private var backups = [UIImage]()
    private var hasRemovedFirstTouch = false

    private var _color = UIColor.black
    private var _brushWidth: CGFloat = 3
    private var _isErasing = false
    
    private var _prevPoint1 = CGPoint.zero
    private var _prevPoint2 = CGPoint.zero
    
    
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
    

    var prevPoint1: CGPoint {
        get {
            return _prevPoint1
        } set {
            _prevPoint1 = newValue
        }
    }
    
    var prevPoint2: CGPoint {
        get {
            return _prevPoint2
        } set {
            _prevPoint2 = newValue
        }
    }
    
    
    init(imageView: UIImageView) {
        _imageView = imageView
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
    
    func touchesBegan(touch: UITouch) {
        _prevPoint1 = touch.previousLocation(in: _imageView)
        _prevPoint2 = touch.previousLocation(in: _imageView)
    }
        
    func touchesMoved(touch: UITouch) {
        UIGraphicsBeginImageContextWithOptions(_imageView.frame.size, false, 0.0)
        let currentPoint = touch.location(in: _imageView)
        _prevPoint2 = _prevPoint1
        _prevPoint1 = touch.previousLocation(in: _imageView)
        
        let context = UIGraphicsGetCurrentContext()
        
        _imageView.image?.draw(in: CGRect(x: 0, y: 0, width: _imageView.frame.width, height: _imageView.frame.height))
        
        
        let mid1 = CGPoint(x: (prevPoint1.x + prevPoint2.x) * 0.5, y: (prevPoint1.y + prevPoint2.y) * 0.5)
        let mid2 = CGPoint(x: (currentPoint.x + prevPoint1.x) * 0.5, y: (currentPoint.y + prevPoint1.y) * 0.5)
        
        context?.move(to: mid1)
        context?.addQuadCurve(to: mid2, control: prevPoint1)

        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(_brushWidth)
        context?.setStrokeColor(_color.cgColor)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        _imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
    }
    
    func saveBackup() {
        if let backupImage = _imageView.image {
            backups.append(backupImage)
            
            if backups.count > 100 {
                backups.removeFirst()
                hasRemovedFirstTouch = true
            }
        }
    }
    
    func undo() {
        var num = 0
        
        if hasRemovedFirstTouch {
            num = 1
        }
        
        if backups.count > num {
            backups.removeLast()
            _imageView.image = backups.last
        }

    }
}












