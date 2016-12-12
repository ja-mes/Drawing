//
//  Sketches.swift
//  Drawing
//
//  Created by James Brown on 12/11/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class Sketches {
    private lazy var ref = FIRDatabase.database().reference()
    private var _items = [FIRDataSnapshot]()
    private var _itemsView: AnyObject
    
    var items: [FIRDataSnapshot] {
        return _items
    }
    
    init(tableView: UITableView) {
        _itemsView = tableView
    }
    
    init(collectionView: UICollectionView) {
        _itemsView = collectionView
    }
    
    
    func handle() {
        if let userId = FIRAuth.auth()?.currentUser?.uid {
            let sketchRef = ref.child("sketches").queryOrdered(byChild: "user").queryEqual(toValue: userId)
            
            sketchRef.observe(.childAdded, with: { (snapshot) in
                self._items.append(snapshot)
                
                if let tableView = self._itemsView as? UITableView {
                    tableView.insertRows(at: [IndexPath(row: self._items.count - 1, section: 0)], with: .automatic)
                } else if let collectionView = self._itemsView as? UICollectionView {
                    collectionView.insertItems(at: [IndexPath(row: self._items.count - 1, section: 0)])
                }
                
            })
        }
    }
    
    
    
}
