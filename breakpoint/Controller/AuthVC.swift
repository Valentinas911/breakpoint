//
//  AuthVC.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/15/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func fbSignInButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: Any) {
        
    }
    
    
}
