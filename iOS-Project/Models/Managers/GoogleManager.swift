//
//  GoogleManager.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 03/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class GoogleManager: NSObject {
    
    static let sharedInstance = GoogleManager()
    
    func login(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        //faking loging with google
        success()
    }
}
