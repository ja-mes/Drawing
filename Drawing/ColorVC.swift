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
        UIColor(red: 244/255, green: 67/255, blue: 54/255, alpha: 1.0),
        UIColor(red: 233/255, green: 28/255, blue: 99/255, alpha: 1.0),
        UIColor(red: 156/255, green: 31/255, blue: 176/255, alpha: 1.0),
        UIColor(red: 103/255, green: 53/255, blue: 183/255, alpha: 1.0),
        UIColor(red: 64/255, green: 78/255, blue: 181/255, alpha: 1.0),
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
