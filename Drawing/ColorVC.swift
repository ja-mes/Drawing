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
        
        UIColor(red: 36/255, green: 148/255, blue: 243/255, alpha: 1.0),
        UIColor(red: 12/255, green: 167/255, blue: 244/255, alpha: 1.0),
        UIColor(red: 6/255, green: 188/255, blue: 212/255, alpha: 1.0),
        UIColor(red: 2/255, green: 150/255, blue: 136/255, alpha: 1.0),
        UIColor(red: 76/255, green: 176/255, blue: 80/255, alpha: 1.0),
        
        UIColor(red: 139/255, green: 196/255, blue: 74/255, alpha: 1.0),
        UIColor(red: 205/255, green: 221/255, blue: 57/255, alpha: 1.0),
        UIColor(red: 255/255, green: 237/255, blue: 59/255, alpha: 1.0),
        UIColor(red: 255/255, green: 194/255, blue: 7/255, alpha: 1.0),
        UIColor(red: 255/255, green: 153/255, blue: 0/255, alpha: 1.0),
        
        UIColor(red: 255/255, green: 88/255, blue: 34/255, alpha: 1.0),
        UIColor(red: 121/255, green: 85/255, blue: 72/255, alpha: 1.0),
        UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1.0),
        UIColor(red: 96/255, green: 125/255, blue: 139/255, alpha: 1.0),
        UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
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
