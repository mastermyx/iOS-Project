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
    
    static let SERVER_URL = "www.fake.url/"
    
    static let DELETE_TASK = "\(SERVER_URL)/deleteTask"
    static let MODIFY_TASK = "\(SERVER_URL)/modifyTask"
    static let ADD_TASK = "\(SERVER_URL)/addTask"
    static let GET_TASK = "\(SERVER_URL)/getTask"
    
    static func requestFor(requestUrl : URLConvertible,
                           method: HTTPMethod = .get,
                           parameters: [String:Any]? = nil,
                           encoding: ParameterEncoding = URLEncoding.default,
                           headers: HTTPHeaders? = nil,
                           success: @escaping ([String:Any], HTTPURLResponse?) -> (),
                           failure: ((Error) -> ())? = nil) {
        
        //faking server answer
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            success([:], nil)
        }
        
    }
}