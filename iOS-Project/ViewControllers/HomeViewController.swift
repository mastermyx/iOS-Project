//
//  HomeViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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
        
        //setting collectionview flow layout
        let numberOfCellsPerRow: CGFloat = 2
        if let flowLayout = taskCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = (view.frame.width / numberOfCellsPerRow) - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: 74)
        }
        
        //load task from fake server
        TaskManager.sharedInstance.get(success: {
            self.taskCollectionView.reloadData()
            print("tasks successfully loaded")
        }, failure: {error in
            print("error loading tasks")
        })
        
        //load user from fake server
        UserManager.sharedInstance.get(success: {
            print("users successfully loaded")
        }, failure: {error in
            print("error loading user")
        })
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.taskCollectionView.reloadData()
    }
    
    
    @IBAction func profileButtonClicked(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! MyProfileViewController
        
        profileVC.myProfile = true
        profileVC.user = AccountManager.sharedInstance.user
        
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    
    // MARK: CollectionView Delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.tasks.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
           return collectionView.dequeueReusableCell(withReuseIdentifier: "AddTaskCell", for: indexPath)
        }
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TaskCollectionViewCell
        cell.setCell(forTask: TaskManager.sharedInstance.tasks[indexPath.item - 1])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let taskVC = storyBoard.instantiateViewController(withIdentifier: "TaskViewController") as! TaskViewController
        
        if indexPath.item > 0 {
            taskVC.new = false
            taskVC.task = TaskManager.sharedInstance.tasks[indexPath.item - 1]
            
        } else {
            taskVC.new = true
        }
        
        self.navigationController?.pushViewController(taskVC, animated: true)
    }

}
