//
//  DrawVC.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class SketchVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var brushWidth: CGFloat = 64
    var swiped = false
    var color = UIColor.black
    
    var sketch: Sketch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sketch = Sketch()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: imageView)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(sketch.color.cgColor)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: imageView)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    @IBAction func erasePressed(_ sender: Any) {
        sketch.toggleEraser()
    }
    
}






















