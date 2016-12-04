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
    var prevPoint1 = CGPoint.zero
    var prevPoint2 = CGPoint.zero
    
    var brushWidth: CGFloat = 64
    var color = UIColor.black
    
    var sketch: Sketch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sketch = Sketch(imageView: imageView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorVC" {
            if let destination = segue.destination as? ColorVC {
                destination.sketch = sketch
            }
        } else if segue.identifier == "SizeVC" {
            if let destination = segue.destination as? SizeVC {
                destination.sketch = sketch
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            prevPoint1 = touch.previousLocation(in: view)
            prevPoint2 = touch.previousLocation(in: view)

            lastPoint = touch.location(in: imageView)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            prevPoint2 = prevPoint1
            prevPoint1 = touch.previousLocation(in: imageView)
            
            lastPoint = sketch.drawPointsWith(touch: touch, prevPoint1: prevPoint1, prevPoint2: prevPoint2)
        }
    }
    
    @IBAction func erasePressed(_ sender: Any) {
        sketch.toggleEraser()
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ColorVC", sender: nil)
    }
    
    @IBAction func sizePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SizeVC", sender: nil)
    }
    
}






















