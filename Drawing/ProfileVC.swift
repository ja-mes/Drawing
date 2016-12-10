//
//  ProfileVC.swift
//  Drawing
//
//  Created by James Brown on 12/6/16.
//  Copyright © 2016 James Brown. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProfileVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var sketches: Array<FIRDataSnapshot> = []
    lazy var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let userId = FIRAuth.auth()?.currentUser?.uid {
            
            let sketchRef = ref.child("sketches").queryOrdered(byChild: "user").queryEqual(toValue: userId)
            
            sketchRef.observe(.childAdded, with: { (snapshot) in
                self.sketches.append(snapshot)
            })
            
        }
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sketches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath) as? ProfileSketchCell {
            let sketchDict = sketches[indexPath.row].value as? [String: AnyObject]
            
            print(String(describing: sketchDict?["imgUrl"]))
        }
        
        
        return UICollectionViewCell()
    }
    
}















