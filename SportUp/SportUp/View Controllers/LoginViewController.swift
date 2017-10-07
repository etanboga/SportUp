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
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButtonTapped(_: UIButton) {
        print("User attempted to login")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        authUI.delegate = self as FUIAuthDelegate
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
    
}

extension LoginViewController : FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        guard let user = user
            else { return }
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.addDetails, sender: self)
            }
        }
    }
}
