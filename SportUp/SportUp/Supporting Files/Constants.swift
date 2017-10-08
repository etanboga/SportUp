//
//  Constants.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import Foundation

struct Constants {
    struct Segue {
    static let addDetails = "addDetails"
    }
    struct UserDefaults {
        static let currentUser = "currentUser"
        static let uid = "uid"
        static let username = "username"
        static let phoneNumber = "phoneNumber"
    }
    static let whiteishColor = 0xFFF1D0
    static let darkBlue = 0x096788
    static let sportsArray = ["football", "basketball"]
    static let locationsArray = ["Intramural Field (F)", "Drake Stadium (F)", "Wooden 1 (B)", "Wooden 2 (B)", "Wooden 3 (B)", "Hitch 1 (B)", "Hitch 2 (B)", "Hitch 3 (B)"]
    static let timeCode : [Int : String] = [1: "12:00am-12:30am", 2: "12:30am-1:00am" , 3: "1:00am-1:30am", 4: "1:30am-2:00am" , 5 : "2:00am-2:30am", 6: "2:30am-3:00am" ,7: "3:00am-3:30am", 8: "3:30am-4:00am", 9: "4:00am-4:30am", 10: "4:30am-5:00am" , 11: "5:00am-5:30am", 12: "5:30am-6:00am" , 13 : "6:00am-6:30am", 14: "6:30am-7:00am" ,15: "7:00am-7:30am", 16: "7:30am-8:00am", 17: "12:00am-12:30am", 18: "12:30am-1:00am" , 19: "1:00am-1:30am", 20: "1:30am-2:00am" , 21 : "2:00am-2:30am", 22: "2:30am-3:00am" ,23: "3:00am-3:30am", 24: "3:30am-4:00am", 25: "4:00am-4:30am", 26: "4:30am-5:00am" , 27: "5:00am-5:30am", 28: "5:30am-6:00am" , 29 : "6:00am-6:30am", 30: "6:30am-7:00am" ,31: "7:00am-7:30am", 32: "7:30am-8:00am", 33: "8:00am-8:30am", 34: "8:30am-9:00am" , 35: "9:00am-10:30am", 36: "10:30am-11:00am" , 37 : "11:00am-11:30am", 38: "11:30am-12:00pm" ,39: "12:00am-12:30pm", 40: "3:30am-4:00am", 41: "4:00am-4:30am", 42: "4:30am-5:00am" , 43: "5:00am-5:30am", 44: "5:30am-6:00am" , 45 : "6:00am-6:30am", 46: "6:30am-7:00am" ,47: "7:00am-7:30am", 48: "7:30am-8:00am"]
    static let timeArray = Array(timeCode.values).sorted()
}
