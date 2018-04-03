//
//  FacebookManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 03/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

let facebookAppID = "XXXXXXX"

class FacebookManager: NSObject {
    
    static let sharedInstance = FacebookManager()
    
    func login(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        //faking loging with facebook
        success()
    }
}
