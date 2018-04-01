//
//  TaskViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit


class TaskViewController: ViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: RoundedButton!
    @IBOutlet weak var deleteButton: RoundedButton!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var urgentButton: UIButton!
    
    var task : Task?
    var new = true
    var user : [User] = []
    var important = false
    var urgent = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting textviews maxlines
        titleTextView.textContainer.maximumNumberOfLines = 3
        
        
        task != nil ? setViewControllerForTask(task: task!) : setViewControllerForNewTask()

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
    }
    func setViewControllerForTask(task: Task) {
        self.task = task
        
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
    }
    @IBAction func deleteButtonClicked(_ sender: Any) {
        TaskManager.sharedInstance.delete(id: task!.id, success: {
            self.navigationController?.popViewController(animated: true)
        }, failure: { error in
            
        })
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        
        
        if new {
            
            
        
            TaskManager.sharedInstance.add(task: self.task!, success: {
                self.navigationController?.popViewController(animated: true)
            }, failure: {error in
                
            })
        } else {
            TaskManager.sharedInstance.modify(id: self.task!.id, task: self.task!, success: {
                self.navigationController?.popViewController(animated: true)
            }, failure: {error in
                
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
}
