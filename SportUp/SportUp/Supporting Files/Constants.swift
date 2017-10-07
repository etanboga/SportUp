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
    static let sportsArray = ["football", "basketball"]
    static let locationsArray = ["Intramural Field (F)", "Drake Stadium (F)", "Wooden 1 (B)", "Wooden 2 (B)", "Wooden 3 (B)", "Hitch 1 (B)", "Hitch 2 (B)", "Hitch 3 (B)"]
    static let timeCode : [Int : String] = [1: "0000-0030",2: "0030-0100" ,3: "0100-0130",4: "0130-0200",5: "0200-0230",6: "0230-0300",7: "0300-0330",8: "0330-0400",9: "0400-0430",10: "0430-0500",11: "0500-0530",12: "0530-0600",13: "0600-0630",14: "0630-0700",15: "0700-0730",16: "0730-0800",17: "0800-0830",18: "0830-0900",19: "0900-0930",20: "0930-1000",21: "1000-1030",22: "1030-1100",23: "1100-1130",24: "1130-1200",25: "1200-1230",26: "1230-1300",27: "1300-1330",28: "1330-1400",29: "1400-1430",30: "1430-1500",31: "1500-1530",32: "1530-1600",33: "1600-1630",34: "1630-1700",35: "1700-1730",36: "1730-1800",37: "1800-1830",38: "1830-1900",39: "1900-1930",40: "1930-2000",41: "2000-2030",42: "2030-2100",43: "2100-2130",44: "2130-2200",45: "2200-2230",46: "2230-2300",47: "2300-2330",48: "2330-2400"]
    static let timeArray = Array(timeCode.values).sorted()
}
