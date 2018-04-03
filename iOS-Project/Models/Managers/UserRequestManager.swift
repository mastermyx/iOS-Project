//
//  UserRequestManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 03/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class UserRequestManager: NSObject {
    
    static func get(success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.GET_USER,
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
