//
//  AccountManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class AccountManager: NSObject {
    static let sharedInstance = AccountManager()
   
    var user : User?
    
    override init() {
        super.init()
        
        
    }
    
}
