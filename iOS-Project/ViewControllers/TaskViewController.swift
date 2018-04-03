//
//  TaskViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit


class TaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UITextViewDelegate {
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: RoundedButton!
    @IBOutlet weak var deleteButton: RoundedButton!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var urgentButton: UIButton!
    
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    
    
    var task : Task?
    var new = true
    var user : [User] = []
    var important = false
    var urgent = false
    var filtredUsers : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "taskTitle".localized
        
        //setting textviews maxlines
        titleTextView.textContainer.maximumNumberOfLines = 3
        
       
       // searchView.backgroundColor = UIColor.init(rgb: 0x80CADC)
        searchView.isHidden = true
        searchTableView.separatorStyle = .none
        searchBar.placeholder = "searchUser".localized
        
        
        task != nil ? setViewControllerForTask(task: task!) : setViewControllerForNewTask()
        
        filtredUsers = UserManager.sharedInstance.users
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: userCollectionView.frame.height, height: userCollectionView.frame.height)
        
    
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        userCollectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setViewControllerForNewTask() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        self.dateLabel.text = formatter.string(from: Date())
        self.descTextView.text = "taskDecription".localized
        self.titleTextView.text = "defaultTaskTitle".localized
        
        self.urgentButton.alpha = self.urgent ? 1 : 0.3
        self.importantButton.alpha = self.important ? 1 : 0.3
    }
    
    func setViewControllerForTask(task: Task) {
        self.task = task
        
        user = task.users
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        self.dateLabel.text = formatter.string(from: task.date)
        self.descTextView.text = task.desc
        self.titleTextView.text = task.title
        
        
        switch task.type {
        case .urgent:
            self.urgent = true
            self.important = false
        case .important:
            self.urgent = false
            self.important = true
        case .regular:
            self.urgent = false
            self.important = false
        case .urgentAndImportant:
            self.urgent = true
            self.important = true
        }
        
        self.urgentButton.alpha = self.urgent ? 1 : 0.3
        self.importantButton.alpha = self.important ? 1 : 0.3
    }
    
    @IBAction func addUserButtonClicked(_ sender: Any) {
        showSearchBar()
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        TaskManager.sharedInstance.delete(id: task!.id, success: {
            self.navigationController?.popViewController(animated: true)
        }, failure: { error in
            
        })
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let type : TaskType
        
        if important && urgent {
            type = .urgentAndImportant
        } else if  important {
            type = .important
        } else if urgent {
            type = .urgent
        } else {
            type = .regular
        }
       
        if new {
            let task = Task(id: "\(Int(arc4random_uniform(9999999)))", title: titleTextView.text, type: type, date: Date(), description: descTextView.text)
            task.setUsers(users: user)
            TaskManager.sharedInstance.add(task: task, success: {
                self.navigationController?.popViewController(animated: true)
            }, failure: {error in
                print("error")
            })
        } else {
            let task = Task(id: self.task!.id, title: titleTextView.text, type: type, date: self.task!.date, description: descTextView.text)
            task.setUsers(users: user)
            TaskManager.sharedInstance.modify(id: self.task!.id, task: task, success: {
                self.navigationController?.popViewController(animated: true)
            }, failure: {error in
                print("error")
            })
        }
        
    }
    
    @IBAction func importantButtonClicked(_ sender: Any) {
        if important {
            self.importantButton.alpha = 0.3
            important = false
        } else {
            self.importantButton.alpha = 1
            important = true
        }
    }
    
    @IBAction func urgentButtonClicked(_ sender: Any) {
        if urgent {
            self.urgentButton.alpha = 0.3
            urgent = false
        } else {
            self.urgentButton.alpha = 1
            urgent = true
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! UserCollectionViewCell
        cell.profilePicture.image = user[indexPath.item].picture
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! MyProfileViewController
        
        profileVC.user = user[indexPath.item]
        
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchUserTableViewCell
      
        cell.profilePictureImageView.image = filtredUsers[indexPath.item].picture
        cell.nameLabel.text = filtredUsers[indexPath.item].name
        
        cell.backgroundColor = UIColor.init(rgb: 0x80CADC)
        if indexPath.item % 2 == 1 {
            cell.overlayView.backgroundColor = UIColor.init(rgb: 0x000000).withAlphaComponent(0.1)
        }
        
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = user.index(where: { $0.id == filtredUsers[indexPath.item].id }) {
        } else {
            user.append(filtredUsers[indexPath.item])
            self.userCollectionView.reloadData()
        }
       
        hideSearchBar()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    
    func showSearchBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.searchView.isHidden = false
    }
    
    func hideSearchBar() {
        self.searchBar.text = ""
        filtredUsers = UserManager.sharedInstance.users
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.searchView.isHidden = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // filtring search bar
        if searchText == "" {
            filtredUsers = UserManager.sharedInstance.users
        } else {
            filtredUsers = filtredUsers.filter({( user : User) -> Bool in
                return user.name.lowercased().contains(searchText.lowercased())
            })
        }
        
        searchTableView.reloadData()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
}
