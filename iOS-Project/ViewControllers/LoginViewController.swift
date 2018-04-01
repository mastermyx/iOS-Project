//
//  LoginViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    @IBOutlet weak var loginButton: RoundedButton!
    
    
    @IBOutlet weak var facebookLoginButton: RoundedButton!
    @IBOutlet weak var googleLoginButton: RoundedButton!
    @IBOutlet weak var signInButton: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       //setting text
        emailTextField.placeholder = "email".localized
        passwordTextField.placeholder = "password".localized
        loginButton.setTitle("login".localized , for: .normal)
        signInButton.setTitle("signIn".localized , for: .normal)
        
        
        //setting status bar color
        UIApplication.shared.statusBarStyle = .lightContent
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        print("login button clicked")
    }

    @IBAction func facebookLoginClicked(_ sender: Any) {
        print("facebook login button clicked")
    }
    
    @IBAction func googleLoginButtonClicked(_ sender: Any) {
        print("google login button clicked")
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        print("sign in button clicked")
    }
    

}
