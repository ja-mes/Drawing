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
    @IBOutlet weak var shareButton: CustomButton!
    @IBOutlet weak var eraseButton: CustomButton!
    
    var sketchPad: SketchPad!
    var sketch: Sketch?
    var previousEraserColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sketchPad = SketchPad(imageView: imageView)
        
        if let sketch = sketch {
            if let image = sketch.image as? UIImage {
                imageView.image = image
                sketchPad.editing()
            }
        } else {
            deleteButton.setTitle("CANCEL", for: .normal)
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
        if let sketch = sketch {
            sketchPad.update(sketch: sketch)
        } else {
            sketchPad.save()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sharePressed(_ sender: UIButton) {
        if let image = imageView.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.assignToContact]
            
            activityVC.popoverPresentationController?.sourceView = shareButton
            activityVC.popoverPresentationController?.sourceRect = CGRect(x: view.frame.midX / 2, y: shareButton.frame.height, width: 0, height: 0)
            
            present(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if let sketch = sketch {
            let alertController = UIAlertController(title: "", message: "Are you sure you want to delete this sketch?", preferredStyle: .actionSheet)
            
            alertController.popoverPresentationController?.sourceView = deleteButton
            alertController.popoverPresentationController?.sourceRect = CGRect(x: 0, y: deleteButton.frame.height, width: 0, height: 0)
            alertController.popoverPresentationController?.permittedArrowDirections = .up
            
            let deleteAction = UIAlertAction(title: "Delete Sketch", style: .destructive, handler: { (action) in
                self.sketchPad.destroy(sketch: sketch)
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(deleteAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
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
            previousEraserColor = eraseButton.backgroundColor
            eraseButton.backgroundColor = UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.0)
        } else {
            if let previousEraserColor = previousEraserColor {
                eraseButton.backgroundColor = previousEraserColor
            }
        }
    }
    
    func image(_image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}






















