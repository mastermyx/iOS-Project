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
    
    let task : [Task] = []
    
    override init() {
        super.init()
        print("TaskManager init")
    }
}
