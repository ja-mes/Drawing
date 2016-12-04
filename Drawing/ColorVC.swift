//
//  ColorVC.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {
    
    let colors = [UIColor.red, UIColor.black, UIColor.green, UIColor.orange, UIColor.purple]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
    }
    
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        
    }
    
}
