//
//  TaskManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class TaskManager: NSObject {
    static let sharedInstance = TaskManager()
    
    var task : [Task] = []
    
    override init() {
        super.init()
        task.append( Task(title: "task1", type: .important, date: Date()))
        task.append( Task(title: "task2", type: .regular, date: Date()))
        task.append( Task(title: "task3", type: .urgent, date: Date()))
        task.append( Task(title: "task4", type: .urgentAndImportant, date: Date()))
    }
    
    
}
