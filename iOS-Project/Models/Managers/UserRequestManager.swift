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
    
    static func modify(user: User, success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.MODIFY_USER,
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
    
    static func getAccount(success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.GET_ACCOUNT,
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
    static func renewPassword(success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.RENEW_PASSWORD,
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
    
    static func register(email: String, password: String, success: (()->())? = nil, failure: ((Error?)->())? = nil) {
        RequestManager.requestFor(
            requestUrl: RequestManager.REGISTER,
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
