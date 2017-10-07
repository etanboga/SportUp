//
//  User.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    //MARK: Properties
    
    let uid: String
    let username: String
    let phoneNumber: Int
    
    //MARK: Init
    
    init(uid: String, username: String, phoneNumber: Int) {
        self.uid = uid
        self.username = username
        self.phoneNumber = phoneNumber
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: Any],
        let username = dict["username"] as? String,
        let phoneNumber = dict["phonenumber"] as? Int
            else { return nil }
        self.uid = snapshot.key
        self.username = username
        self.phoneNumber = phoneNumber
    }
}
