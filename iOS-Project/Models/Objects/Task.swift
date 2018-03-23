//
//  Task.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit


enum TaskType {
    case type1
    case type2
    case type3
    case type4
}

class Task: NSObject {
    let title : String
    let type : TaskType
    
    
    init(title: String, type: TaskType) {
        self.title = title
        self.type = type
    }
}
