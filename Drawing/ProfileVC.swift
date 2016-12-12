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
    
    var sketches: Sketches!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        sketches = Sketches()
        sketches.handleCollectionView(collectionView)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sketches.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath) as? ProfileSketchCell {
            let sketchDict = sketches.items[indexPath.row].value as? [String: AnyObject]
            
            if let imgUrl = sketchDict?["imgUrl"] as? String {
               
                //cell.imageView.image = sketches.downloadImageFrom(url: imgUrl)
                
                cell.configure(imgUrl: imgUrl)
            }
            
            print(String(describing: sketchDict?["imgUrl"]))
            
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
}















