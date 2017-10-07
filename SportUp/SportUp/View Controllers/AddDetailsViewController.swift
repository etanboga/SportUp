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
        
        let userAttrs = ["username": username, "phoneNumber" : phoneNumber] as [String: Any]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                
                // handle newly created user here
            })
        }
    }
}
