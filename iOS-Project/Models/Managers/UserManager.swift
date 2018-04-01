//
//  UserManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 01/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    static let sharedInstance = UserManager()
    
    var user : [Task] = []
    
    override init() {
        super.init()
    }
    
    
    
}
