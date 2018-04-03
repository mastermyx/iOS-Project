//
//  MyProfileViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var saveButton: RoundedButton!
    @IBOutlet weak var logoutButton: RoundedButton!
    @IBOutlet weak var renewPasswordButton: RoundedButton!
    
    var user : User?
    var myProfile = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting title
        self.title = "yourProfile".localized.capitalized

        
        if user != nil {
            setProfile(forUser: user!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setProfile(forUser user: User) {
        if !myProfile {
            buttonView.isHidden = true
            emailTextView.isEditable = false
            descTextView.isEditable = false
            nameTextView.isEditable = false
        } else {
            saveButton.setTitle("saveChanges".localized, for: .normal)
            renewPasswordButton.setTitle("renewPassword".localized, for: .normal)
            logoutButton.setTitle("logout".localized, for: .normal)
        }
        
        profilePictureImageView.image = user.picture
        emailTextView.text = user.email
        descTextView.text = user.desc
        nameTextView.text = user.name
    }
    
    @IBAction func renewPasswordClicked(_ sender: Any) {
        AccountManager.sharedInstance.renewPassword(success: {
            let alert = UIAlertController(title: "alert".localized, message: "sendEmail".localized, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }, failure: { error in
            let alert = UIAlertController(title: "alert".localized, message: "error".localized, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "loggedOut", sender: self)
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        //creating new user with infos
        let newUser = User(name: nameTextView.text, picture: user!.picture, id: user!.id, email: emailTextView.text, desc: descTextView.text)
        AccountManager.sharedInstance.modifyUser(user: newUser, success: {
            
            self.navigationController?.popViewController(animated: true)
        }, failure: {error in
            
        })
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
