//
//  MainVC.swift
//  Drawing
//
//  Created by James Brown on 12/14/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Sketch>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        fetchSketches()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            return sections[section].numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SketchCell") {
            return cell
        }
        
        return UITableViewCell()
    }
    
    func fetchSketches() {
        
    }

    @IBAction func plusButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SketchVC", sender: nil)
    }
}
