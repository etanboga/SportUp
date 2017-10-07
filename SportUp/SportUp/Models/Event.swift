//
//  Event.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot


class Event{
    //create lets for everything
    let eventID: String
    let eventName: String
    let creatorID: String
    let eventSport: String
    let eventLocation: String
    let creatorContact: String
    let emptySpot: Int
    let time: [Int]
    
    init(eventID: String, eventName: String, creatorID: String, eventSport: String, eventLocation: String, creatorContact: String, emptySpot: Int, time: [Int]) {
        self.eventID = eventID
        self.eventName = eventName
        self.creatorID = creatorID
        self.eventSport = eventSport
        self.eventLocation = eventLocation
        self.creatorContact = creatorContact
        self.emptySpot = emptySpot
        self.time = time
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict1 = snapshot.value as? [String : Any],
            let eventName = dict1["eventNAme"] as? String,
            let eventSport = dict1["eventSport"] as? String,
            let eventLocation = dict1["eventLocation"] as? String,
            let  emptySpot = dict1["emptySpot"] as? Int,
            let time = dict1["time"] as? [Int]
            else { return nil }
            let creatorID: String = User.current.uid
            let creatorContact: String  = User.current.phoneNumber
        
        self.eventID = snapshot.key
        self.eventName = eventName
        self.creatorID = creatorID
        self.eventSport = eventSport
        self.eventLocation = eventLocation
        self.creatorContact = creatorContact
        self.emptySpot = emptySpot
        self.time = time
        
    }
}

