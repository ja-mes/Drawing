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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SketchCell") as? SketchCell {
            configureCell(cell: cell, indexPath: indexPath)
            
            cell.editButton.tag = indexPath.row
            cell.editButton.addTarget(self, action: #selector(editButtonPressed(sender:)), for: .touchUpInside)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                if let cell = tableView.cellForRow(at: indexPath) as? SketchCell {
                    configureCell(cell: cell, indexPath: indexPath)
                }
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }

    func configureCell(cell: SketchCell, indexPath: IndexPath) {
        let sketch = controller.object(at: indexPath)
        
        if let image = sketch.image as? UIImage {
            cell.sketchImageView.image = image
            
            if let date =  sketch.date as? Date {
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateStyle = .long
                
                cell.dateLl.text = dateFormatter.string(from: date)
            }
        }
    }
    
    func fetchSketches() {
        let fetchRequest: NSFetchRequest<Sketch> = Sketch.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            print("Unable to fetch sketches: \(error)")
        }
    }

    func editButtonPressed(sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        performSegue(withIdentifier: "SketchVC", sender: controller.object(at: indexPath))
    }
    
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SketchVC", sender: nil)
    }
}










