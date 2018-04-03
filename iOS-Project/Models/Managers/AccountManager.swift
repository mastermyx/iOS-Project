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
    
    func login(withEmail email: String, password: String, success: @escaping (()->()), failure: @escaping ((Error)->())) {
        UserRequestManager.getAccount(success: {
            //creating fake users list
            self.user = User.init(name: "Donald Trump", picture: #imageLiteral(resourceName: "profile-picture1"), id: "1", email: "donald.trump@usa.com", desc: "Mr president.")

            success()
        }, failure: { (error) in
            failure(error!)
            print("error get")
        })
    }
    
    func loginWithFacebook(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        FacebookManager.sharedInstance.login(success: {
            //creating fake user
            self.user = User.init(name: "Donald Trump", picture: #imageLiteral(resourceName: "profile-picture1"), id: "1", email: "donald.trump@usa.com", desc: "Mr president.")
            
            success()
        }, failure: { (error) in
            failure(error)
            print("error get")
        })
    }
    
    func loginWithGoogle(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        GoogleManager.sharedInstance.login(success: {
            //creating fake user
            self.user = User.init(name: "Donald Trump", picture: #imageLiteral(resourceName: "profile-picture1"), id: "1", email: "donald.trump@usa.com", desc: "Mr president.")
            
            success()
        }, failure: { (error) in
            failure(error)
            print("error get")
        })
    }
    
    func renewPassword(success: @escaping (()->()), failure: @escaping ((Error)->())) {
        UserRequestManager.renewPassword(success: {
            success()
        }, failure: { (error) in
            failure(error!)
            print("error get")
        })
    }

    func modifyUser(user: User, success: @escaping (()->()), failure: @escaping ((Error)->())) {
        UserRequestManager.modify(user: user, success: {
            self.user = user 
            UserManager.sharedInstance.modify(userForID: user.id, newUser: user)
            success()
        }, failure: { (error) in
            failure(error!)
            print("error get")
        })
    }
    
    
}
