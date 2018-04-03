//
//  LoginViewController.swift
//  iOS-Project
//
//  Created by Arthur Hatchiguian on 04/03/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            error()
            return
        }
        
        AccountManager.sharedInstance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, success: {
            self.loggedIn()
       }, failure: {error in
        
       })
    }

    @IBAction func facebookLoginClicked(_ sender: Any) {
        AccountManager.sharedInstance.loginWithFacebook(success: {
            self.loggedIn()
        }, failure: {error in
            
        })
        
    }
    
    @IBAction func googleLoginButtonClicked(_ sender: Any) {
        AccountManager.sharedInstance.loginWithGoogle(success: {
            self.loggedIn()
        }, failure: {error in
            
        })
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        print("sign in button clicked")
    }
    
    func loggedIn(){
        performSegue(withIdentifier: "loggedIn", sender: self)
    }
    
    func error() {
        let alert = UIAlertController(title: "alert".localized, message: "error".localized, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
