//
//  HomeVC.swift
//  Drawing
//
//  Created by James Brown on 12/1/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    // Segment Outlets
    @IBOutlet var segments: [CustomButton]!
    
    var sketches: Sketches!
    var selectedSegmentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        sketches = Sketches()
        sketches.handleTableView(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if FIRAuth.auth()?.currentUser == nil {
            DispatchQueue.main.async {
                
                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthVC")
                self.present(viewController, animated: true, completion: nil)
            }
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sketches.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DrawCell") {
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    @IBAction func segmentChanged(_ sender: CustomButton) {
        selectSegment(button: sender)
    }
    
    func selectSegment(button: CustomButton) {
        if let index = segments.index(of: button) {
            selectedSegmentIndex = index
        }
        
        for b in segments { 
            if b == button {
                b.backgroundColor = UIColor(hexString: "#D6D6D6")
            } else {
                b.backgroundColor = UIColor.white
            }
        }
        
    }
    
}







