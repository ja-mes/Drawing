//
//  SizeVC.swift
//  Drawing
//
//  Created by James Brown on 12/4/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class SizeVC: UIViewController {
    var sketchPad: SketchPad!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var sizes: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        for i in buttons {
            i.backgroundColor = UIColor.clear
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sizePressed(_ sender: UIButton) {
        if sender == buttons[0] {
           sketchPad.brushWidth = 1
        } else if sender == buttons[1] {
            sketchPad.brushWidth = 2
        } else {
            sketchPad.brushWidth = sizes[sender.tag].frame.size.width
        }
        
        
        dismiss(animated: true, completion: nil)
    }
}
