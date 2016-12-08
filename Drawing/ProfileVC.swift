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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let userId = FIRAuth.auth()?.currentUser?.uid {
            let ref = FIRDatabase.database().reference().child("sketches").queryOrdered(byChild: "user").queryEqual(toValue: userId)
            
            ref.observe(.value, with: { (snapshot) in
                if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for child in snapshot {
                        let value = child.value as? NSDictionary
                        
                        if let imgUrl = value?["imgUrl"] {
                            print(imgUrl)
                        }
                    }
                    
                }
                
            })
            
        }
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath)
        return cell
    }
    
}
