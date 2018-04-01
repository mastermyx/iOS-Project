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
    
    var tasks : [Task] = []
    
    override init() {
        super.init()
    }
    
    
    
    func modify(id: String, task: Task, success: @escaping (()->()), failure: @escaping ((Error)->())) {
        TaskRequestManager.modify(id: id, success: {
                success()
            }, failure: { (error) in
                failure(error!)
                print("error modify")
            })
    }
    
    func delete(id: String, success: @escaping (()->()), failure: @escaping ((Error)->())) {
        TaskRequestManager.delete(id: id, success: {
            for task in self.tasks {
                if task.id == id {
                    self.task.remove(at: self.task.index(of: task)!)
                    break
                }
            }
        
            success()
        }, failure: { (error) in
            failure(error!)
            print("error delete")
        })
    }
    
    func get(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        TaskRequestManager.get(success: {
            
            //creating fake task list
            var tasks = [] as [Task]
            
            tasks.append(Task(id: "1", title: "task1", type: .important, date: Date(), description: "desc 1"))
            tasks.append(Task(id: "2", title: "task2", type: .regular, date: Date(), description: "desc 2"))
            tasks.append(Task(id: "3", title: "task3", type: .urgentAndImportant, date: Date(), description: "desc 3"))
            tasks.append(Task(id: "4", title: "task4", type: .urgent, date: Date(), description: "desc 4"))
            
            self.tasks = tasks
            
            success()
        }, failure: { (error) in
            failure(error!)
            print("error get")
        })
    }
    
    func add(task: Task, success: @escaping (()->()), failure: @escaping ((Error)->())) {
        TaskRequestManager.add(task: task, success: {
            success()
        }, failure: { error in
            failure(error!)
            print("error add")
        })
    }
    
}
