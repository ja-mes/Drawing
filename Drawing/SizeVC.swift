//
//  SizeVC.swift
//  Drawing
//
//  Created by James Brown on 12/4/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class SizeVC: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
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
        print(sender.tag)
    }
}
