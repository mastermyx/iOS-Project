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
    
    var users : [User] = []
    
    override init() {
        super.init()
    }
    
    func get(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        UserRequestManager.get(success: {
            
            //creating fake users list
            var user = [] as [User]
            
            user.append(User.init(name: "Donald Trump", picture: #imageLiteral(resourceName: "profile-picture1"), id: "1", email: "donald.trump@usa.com", desc: "Mr president."))
            user.append(User.init(name: "Claire Lemaire", picture: #imageLiteral(resourceName: "profile-picture2"), id: "2", email: "claire.lm@hotmail.com", desc: "Bla bla bla bla"))
            user.append(User.init(name: "Alexandra White", picture: #imageLiteral(resourceName: "profile-picture3"), id: "3", email: "Alexandra.white@gmail.com", desc: "Mr president wife."))
            
            self.users = user
            
            success()
        }, failure: { (error) in
            failure(error!)
            print("error get")
        })
    }
    
    func user(forId id: String) -> User? {
        for user in users {
            if id == user.id{
                return user
            }
        }
        return nil
    }
    
    func modify(userForID id: String, newUser: User) {
        for obj in users {
            if obj.id == id {
                print("USER FIND ")
                self.users[self.users.index(of: obj)!] = newUser
                break
            }
        }
    }
    
}
