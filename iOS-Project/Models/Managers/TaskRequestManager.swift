//
//  TaskRequestManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 01/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class TaskRequestManager: NSObject {

    static func delete(id: String, success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.DELETE_TASK,
            method: .post,
            parameters: ["id":id],
            success: { (result, response) in
                if success != nil {
                    success!()
                }
        }) { (error) in
            if failure != nil {
                failure!(error)
            }
        }
    }
    
    static func add(task: Task, success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.ADD_TASK,
            method: .post,
            parameters: ["desc":task.desc,
                         "id":task.id,
                         "type":task.type.hashValue,
                         "title":task.title,
                         "date":task.date.description
            ],
            success: { (result, response) in
                if success != nil {
                    success!()
                }
        }) { (error) in
            if failure != nil {
                failure!(error)
            }
        }
    }
    
    static func modify(id: String, success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.MODIFY_TASK,
            method: .post,
            parameters: ["id":id],
            success: { (result, response) in
                if success != nil {
                    success!()
                }
        }) { (error) in
            if failure != nil {
                failure!(error)
            }
        }
    }
    
    static func get(success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.GET_TASK,
            method: .post,
            parameters: nil,
            success: { (result, response) in
                if success != nil {
                    success!()
                }
        }) { (error) in
            if failure != nil {
                failure!(error)
            }
        }
    }
}
