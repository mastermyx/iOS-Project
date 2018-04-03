//
//  RequestManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 01/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class RequestManager: NSObject {

    static let SERVER_URL = "https://www.fake.url/"
    
    static let DELETE_TASK = "\(SERVER_URL)/deleteTask"
    static let MODIFY_TASK = "\(SERVER_URL)/modifyTask"
    static let ADD_TASK = "\(SERVER_URL)/addTask"
    static let GET_TASK = "\(SERVER_URL)/getTask"
    static let GET_USER = "\(SERVER_URL)/getUsers"
    static let MODIFY_USER = "\(SERVER_URL)/modifyUser"
    static let GET_ACCOUNT = "\(SERVER_URL)/getAccount"
    static let RENEW_PASSWORD = "\(SERVER_URL)/renewPassword"
    
    
    static func requestFor(requestUrl : URLConvertible,
                           method: HTTPMethod = .get,
                           parameters: [String:Any]? = nil,
                           encoding: ParameterEncoding = URLEncoding.default,
                           headers: HTTPHeaders? = nil,
                           success: @escaping ([String:Any], HTTPURLResponse?) -> (),
                           failure: ((Error) -> ())? = nil) {
        
        //faking server answer after short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            success([:], nil)
        }
        
    }
}
