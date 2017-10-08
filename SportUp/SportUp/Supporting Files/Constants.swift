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
    static let timeCode : [Int : String] = [1: "12:00am-12:30am", 2: "12:30am-1:00am" , 3: "1:00am-1:30am", 4: "1:30am-2:00am" , 5 : "2:00am-2:30am", 6: "2:30am-3:00am" ,7: "3:00am-3:30am", 8: "3:30am-4:00am", 9: "4:00am-4:30am", 10: "4:30am-5:00am" , 11: "5:00am-5:30am", 12: "5:30am-6:00am" , 13 : "6:00am-6:30am", 14: "6:30am-7:00am" ,15: "7:00am-7:30am", 16: "7:30am-8:00am", 17: "8:00am-8:30am", 18: "8:30am-9:00am" , 19: "9:00am-9:30am", 20: "9:30am-10:00am" , 21 : "10:00am-10:30am", 22: "10:30am-11:00am" ,23: "11:00am-11:30am", 24: "11:30am-12:00pm", 25: "12:00pm-12:30pm", 26: "12:30pm-1:00pm" , 27: "1:00pm-1:30pm", 28: "1:30pm-2:00pm" , 29 : "2:00pm-2:30pm", 30: "2:30pm-3:00pm" ,31: "3:00pm-3:30pm", 32: "3:30pm-4:00pm", 33: "4:00pm-4:30pm", 34: "4:30pm-5:00pm" , 35: "5:00pm-5:30pm", 36: "5:30pm-6:00pm" , 37 : "6:00pm-6:30pm", 38: "6:30pm-7:00pm" ,39: "7:00pm-7:30pm", 40: "7:30pm-8:00pm", 41: "8:00pm-8:30pm", 42: "8:30pm-9:00pm" , 43: "9:00pm-9:30pm", 44: "9:30pm-10:00pm" , 45 : "10:00pm-10:30pm", 46: "10:30pm-11:00pm" ,47: "11:00pm-11:30pm", 48: "11:30pm-12:00am"]
    static let timeArray = Array(timeCode.values).sorted()
}
