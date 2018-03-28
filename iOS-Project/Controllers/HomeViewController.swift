//
//  HomeViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class HomeViewController: ViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    


    @IBOutlet weak var taskCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //setting transparent navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "SFUIText-Medium", size: 17)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        //setting title
        self.title = "home".localized.capitalized
        
        
        let numberOfCellsPerRow: CGFloat = 2
        if let flowLayout = taskCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
           // let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
          //  let cellWidth = (view.frame.width - max(0, numberOfCellsPerRow - 1) * horizontalSpacing)/numberOfCellsPerRow
           let cellWidth = view.frame.width / numberOfCellsPerRow - 3
            
            flowLayout.itemSize = CGSize(width: cellWidth, height: 74)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func profileButtonClicked(_ sender: Any) {
        print("profile button clicked")
    }
    
    
    // MARK: CollectionView Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("test")
        return TaskManager.sharedInstance.task.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let cell = indexPath.item == 0 ? collectionView.dequeueReusableCell(withReuseIdentifier: "AddTaskCell", for: indexPath) as! AddTaskCollectionViewCell : collectionView.dequeueReusableCell(withReuseIdentifier: "AddTaskCell", for: indexPath) as! AddTaskCollectionViewCell
        
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        // number of item per row
//        let numberOfSets = CGFloat(2)
//
//        let width = (collectionView.frame.size.width - (numberOfSets * view.frame.size.width / 15)) / numberOfSets
//
//        let height = collectionView.frame.size.height / 2
//
//        return CGSize(width: width, height: height)
//    }
//
//    // UICollectionViewDelegateFlowLayout method
//
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//
//        let cellWidthPadding = collectionView.frame.size.width / 30
//        let cellHeightPadding = collectionView.frame.size.height / 4
//        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding,
//                            bottom: cellHeightPadding,right: cellWidthPadding)
//    }

}
