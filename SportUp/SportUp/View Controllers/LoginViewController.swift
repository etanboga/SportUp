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
        if let error = error {
            assertionFailure("Error with Firebase login: \(error.localizedDescription)")
            return
        }
        guard let user = user
            else { return }
        let userRef = Database.database().reference().child("users").child(user.uid)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
                print("New user!")
            }
        }
    }
}
