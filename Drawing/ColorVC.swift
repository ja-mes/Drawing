//
//  ColorVC.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {
    var sketchPad: SketchPad!
    
    let colors = [
        UIColor(red:0.96, green:0.26, blue:0.21, alpha:1.0),
        UIColor(red:0.91, green:0.12, blue:0.39, alpha:1.0),
        UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.0),
        UIColor(red:0.4, green:0.23, blue:0.72, alpha:1.0),
        UIColor(red:0.25, green:0.32, blue:0.71, alpha:1.0)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
    }
    
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        sketchPad.color = colors[sender.tag]
        
        dismiss(animated: true, completion: nil)
    }
    
}
