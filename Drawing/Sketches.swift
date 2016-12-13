//
//  Sketches.swift
//  Drawing
//
//  Created by James Brown on 12/11/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Sketches {
    private lazy var database = FIRDatabase.database().reference()
    private lazy var storeage = FIRStorage.storage()
    private var _items = [FIRDataSnapshot]()
    
    var items: [FIRDataSnapshot] {
        return _items
    }
    
    func handleCollectionView(_ collectionView: UICollectionView) {
        handle(itemView: collectionView)
    }
    
    func handleTableView(_ tableView: UITableView) {
        handle(itemView: tableView)
    }
    
    private func handle(itemView: AnyObject) {
        if let userId = FIRAuth.auth()?.currentUser?.uid {
            let sketchRef = database.child("sketches").queryOrdered(byChild: "user").queryEqual(toValue: userId)
            
            sketchRef.observe(.childAdded, with: { (snapshot) in
                self._items.append(snapshot)
                
                if let tableView = itemView as? UITableView {
                    tableView.insertRows(at: [IndexPath(row: self._items.count - 1, section: 0)], with: .automatic)
                } else if let collectionView = itemView as? UICollectionView {
                    collectionView.insertItems(at: [IndexPath(row: self._items.count - 1, section: 0)])
                }
                
            })
        }
    }
    
    func downloadImageFrom(url: String) -> UIImage? {
        DispatchQueue.main.async {
            
        }
        let ref = FIRStorage.storage().reference(forURL: url)
        var img: UIImage?
        
        ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
            
            if let error = error {
                print("Unable to download sketch from firebase storeage: \(error)")
            }
            
            if let imgData = data {
                img = UIImage(data: imgData)
            }
        })
        
        
        return img
    }
    
}
