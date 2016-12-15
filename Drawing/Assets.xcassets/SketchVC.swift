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
    
    var sketchPad: SketchPad!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sketchPad = SketchPad(imageView: imageView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorVC" {
            if let destination = segue.destination as? ColorVC {
                destination.sketch = sketchPad
            }
        } else if segue.identifier == "SizeVC" {
            if let destination = segue.destination as? SizeVC {
                destination.sketch = sketchPad
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            sketchPad.touchesBegan(touch: touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            sketchPad.touchesMoved(touch: touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        sketchPad.saveBackup()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        sketchPad.save()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func erasePressed(_ sender: UIButton) {
        sketchPad.toggleEraser()
        
        if sketchPad.isErasing {
            sender.backgroundColor = UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.0)
        } else {
            sender.backgroundColor = UIColor(red:0.98, green:0.58, blue:0.42, alpha:1.0)
        }
        
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        sketchPad.undo()
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ColorVC", sender: nil)
    }
    
    @IBAction func sizePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SizeVC", sender: nil)
    }
}






















