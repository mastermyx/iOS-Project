//
//  SignInViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 03/04/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var signInButton: RoundedButton!
    @IBOutlet weak var emailTextView: RoundedTextField!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "signIn".localized
        self.signInButton.setTitle("signIn".localized, for: .normal)
        self.backButton.setTitle("back".localized, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signInButtonClicked(_ sender: Any) {
        AccountManager.sharedInstance.register(email: emailTextView.text!, password: passwordTextField.text!, success: {
            self.loggedIn()
        }, failure: {error in
            self.error()
        })
    }
    
    
    
    func loggedIn(){
        performSegue(withIdentifier: "Registred", sender: self)
    }
    
    func error() {
        let alert = UIAlertController(title: "alert".localized, message: "error".localized, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
