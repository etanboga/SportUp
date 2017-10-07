//
//  LoginViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/6/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseAuthUI

class LoginViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButtonTapped(_: UIButton) {
        print("User attempted to login")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        authUI.delegate = self as! FUIAuthDelegate
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
    
}

extension LoginViewController : FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        print("Fireabase handling signup  or login")
    }
}
