//
//  User.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class User: NSObject {
    let name : String
    let picture : UIImage
    let id : String
    let email : String
    let desc : String
    
    init(name: String, picture: UIImage, id: String, email: String, desc: String) {
        self.name = name
        self.email = email
        self.desc = desc
        self.picture = picture
        self.id = id 
    }
}
