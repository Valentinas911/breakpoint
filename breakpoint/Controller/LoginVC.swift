//
//  LoginVC.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/15/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self

    }

    @IBAction func signInButtonWasPressed(_ sender: Any) {
        
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
                
                debugPrint("There's no such user, trying to create one.")
                
                if error != nil {
                    print(error?.localizedDescription ?? "Error")
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, error) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!, completion: { (success, error) in
                            if success {
                                debugPrint("Succesfully created a user.")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    } else {
                        print(String(describing: error?.localizedDescription))
                    }
                        
                })
                
            }
            
        }
        
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    
    
}
