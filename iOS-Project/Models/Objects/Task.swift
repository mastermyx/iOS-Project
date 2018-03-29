//
//  Task.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit


enum TaskType {
    case regular
    case important
    case urgent
    case urgentAndImportant
}

class Task: NSObject {
    let title : String
    let type : TaskType
    let date : Date
    
    init(title: String, type: TaskType, date: Date) {
        self.title = title
        self.type = type
        self.date = date
    }
}
