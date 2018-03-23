//
//  Friend.swift
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
    
    init(name: String, picture: UIImage, id: String) {
        self.name = name
        self.picture = picture
        self.id = id 
    }
}
