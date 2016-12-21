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
    @IBOutlet weak var plusButton: UIButton!
    
    var controller: NSFetchedResultsController<Sketch>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            tableView.rowHeight = 600
            plusButton.setImage(#imageLiteral(resourceName: "plus_icon-lg"), for: .normal)
        }
        
        fetchSketches()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SketchVC" {
            if let destination = segue.destination as? SketchVC {
                if let sketch = sender as? Sketch {
                    destination.sketch = sketch
                }
            }
        }
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
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
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
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        self.controller = controller
        
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            print("Unable to fetch sketches: \(error)")
        }
    }

    @IBAction func editButtonPressed(_ sender: UIButton) {
        let buttonPositon = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: buttonPositon) {
            performSegue(withIdentifier: "SketchVC", sender: controller.object(at: indexPath))
        }

    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SketchVC", sender: nil)
    }
}










