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
    @IBOutlet weak var deleteButton: CustomButton!
    @IBOutlet weak var eraseButton: CustomButton!
    
    var sketchPad: SketchPad!
    var sketch: Sketch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sketchPad = SketchPad(imageView: imageView)
        
        if let sketch = sketch {
            if let image = sketch.image as? UIImage {
                imageView.image = image
                sketchPad.editing()
                
                deleteButton.isHidden = false
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleEraser), name: NSNotification.Name("SketchPad:eraserToggled"), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ColorVC" {
            if let destination = segue.destination as? ColorVC {
                destination.sketchPad = sketchPad
            }
        } else if segue.identifier == "SizeVC" {
            if let destination = segue.destination as? SizeVC {
                destination.sketchPad = sketchPad
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
        let alertController = UIAlertController(title: "", message: "What would you like to do with this sketch?", preferredStyle: .actionSheet)
        
        let saveLocallyAction = UIAlertAction(title: "Save to Photo Library", style: .default) { (action) in
            
        }
        alertController.addAction(saveLocallyAction)
        
        let doNothingAction = UIAlertAction(title: "Don't export", style: .cancel, handler: nil)
        alertController.addAction(doNothingAction)
        
        present(alertController, animated: true, completion: nil)
        
        
        if let sketch = sketch {
            sketchPad.update(sketch: sketch)
        } else {
            sketchPad.save()
        }
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if let sketch = sketch {
            let alertController = UIAlertController(title: "", message: "Are you sure you want to delete this sketch?", preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "Delete Sketch", style: .destructive, handler: { (action) in
                self.sketchPad.destroy(sketch: sketch)
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(deleteAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func erasePressed(_ sender: UIButton) {
        sketchPad.toggleEraser()
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
    
    func toggleEraser() {
        if sketchPad.isErasing {
            eraseButton.backgroundColor = UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.0)
        } else {
            eraseButton.backgroundColor = UIColor(red:0.98, green:0.58, blue:0.42, alpha:1.0)
        }
    }
}






















