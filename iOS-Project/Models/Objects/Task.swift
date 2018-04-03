//
//  Task.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit


enum TaskType : Int {
    case regular = 1
    case important = 2
    case urgent = 3
    case urgentAndImportant = 4
}

class Task: NSObject {
    var title : String
    var type : TaskType
    var date : Date
    var id : String
    var desc : String
    var users : [User] = []
    
    init(id: String, title: String, type: TaskType, date: Date, description: String) {
        self.id = id
        self.title = title
        self.type = type
        self.date = date
        self.desc = description
    }
    
    func setUsers(users: [User]) {
        self.users = users
    }
}
