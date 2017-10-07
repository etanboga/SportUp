//
//  AddDetailsViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddDetailsViewController : UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func finishSignUpTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            let phoneNumber = Int(phoneNumberTextField.text!),
            !((phoneNumberTextField.text?.isEmpty)!),
            !username.isEmpty else { return }
        UserService.create(firUser, username: username, phoneNumber: phoneNumber) { (user) in
            guard let user = user else { return }
            print("Created new user: \(user.username)")
            
            User.setCurrent(user)
    
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
