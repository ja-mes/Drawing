//
//  Sketch.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
//
//class Sketch {
//    private var _color: UIColor = UIColor.black
//    private var _lastPoint: CGPoint = CGPoint.zero
//    private var _brushWidth: CGFloat = 3
//    private var _swiped = false
//    
//    var color: UIColor {
//        return _color
//    }
//    
//    var lastPoint: CGPoint {
//        get {
//            return _lastPoint
//        } set {
//            _swiped = true
//            _lastPoint = newValue
//        }
//    }
//    
//    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
//        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0)
//        let context = UIGraphicsGetCurrentContext()
//        
//        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//        
//        context?.move(to: fromPoint)
//        context?.addLine(to: toPoint)
//        context?.setLineCap(CGLineCap.round)
//        context?.setLineWidth(brushWidth)
//        context?.setStrokeColor(UIColor.black.cgColor)
//        context?.setBlendMode(CGBlendMode.normal)
//        
//        context?.strokePath()
//        
//        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        tempImageView.alpha = opacity
//        
//        
//        UIGraphicsEndImageContext()
//    }
//
//    
//    
//}
