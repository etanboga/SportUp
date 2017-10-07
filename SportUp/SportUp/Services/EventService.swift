//
//  EventService.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import FirebaseDatabase
struct EventService {
    static func createEvent(name eventName: String, userID creatorID: String, sport eventSport: String, location eventLocation : String, contact creatorContact: String, remainingSpots emptySpots: Int, time: String, completion: @escaping (Event?) -> Void) {
        let eventsRef = Database.database().reference().child("events").child(eventSport).child(eventLocation).childByAutoId()
        let eventVariables = ["name" : eventName, "creator" : creatorID, "sport": eventSport, "location": eventLocation, "contact": creatorContact, "emptySpots": emptySpots, "time" : time] as [String : Any]
        eventsRef.setValue(eventVariables) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                let addedEvent = Event(snapshot: snapshot)
                completion(addedEvent)
            })
        }
    }
}

