//
//  SizeVC.swift
//  Drawing
//
//  Created by James Brown on 12/4/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit

class SizeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func sizePressed(_ sender: UIButton) {
        print(sender.tag)
    }
}
