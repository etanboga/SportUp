//
//  User.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject {
    
    // MARK: - Singleton
    
    private static var _current: User?
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    let phoneNumber: Int
    
    // MARK: - Init
    
    init(uid: String, username: String, phoneNumber: Int) {
        self.uid = uid
        self.username = username
        self.phoneNumber = phoneNumber
        super.init()
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String,
            let phoneNumber = dict["phoneNumber"] as? Int
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        self.phoneNumber = phoneNumber
        super.init()
    }
    // 1
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        // 2
        if writeToUserDefaults {
            // 3
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            // 4
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = user
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
            let phoneNumber = aDecoder.decodeInteger(forKey: Constants.UserDefaults.phoneNumber)

        
        self.uid = uid
        self.username = username
        self.phoneNumber = phoneNumber
        
        super.init()
    }
}


extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
        aCoder.encode(phoneNumber, forKey: Constants.UserDefaults.phoneNumber)
    }
}
