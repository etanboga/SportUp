//
//  EventService.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import FirebaseDatabase
struct EventService {
    static func createEvent(name eventName: String, userID creatorID: String, sport eventSport: String, location eventLocation : String, contact creatorContact: String, remainingSpots emptySpots: Int, time: String, date: String, completion: @escaping (Event?) -> Void) {
        let eventsRef = Database.database().reference()
        let key = eventsRef.child("events").child(eventSport).child(eventLocation).childByAutoId().key
        let eventVariables = ["name" : eventName, "creator" : creatorID, "sport": eventSport, "location": eventLocation, "contact": creatorContact, "emptySpots": emptySpots, "time" : time, "date" : date] as [String : Any]
        let childUpdates = ["/events/\(eventSport)/\(eventLocation)/\(key)" : eventVariables, "/users/\(User.current.uid)/events/\(key)": eventVariables]
        eventsRef.updateChildValues(childUpdates) { (error, ref) in
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
    static func loadUserEvents (completion: @escaping ([Event]) -> Void) {
        let eventsRef = Database.database().reference().child("users").child(User.current.uid).child("events")
        eventsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot]
                else {return completion([])}
            var events = [Event] ()
            for eventSnap in snapshot {
                events.append(Event(snapshot: eventSnap)!)
            }
            completion(events)
        })
    }
    static func loadSearchResults (sport: String, location: String, completion: @escaping ([Event])-> Void) {
        let eventsRef = Database.database().reference().child("events").child(sport).child(location)
        eventsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot]
                else {return completion([])}
            var searchResults = [Event] ()
            for eventSnap in snapshot {
                searchResults.append(Event(snapshot: eventSnap)!)
            }
            completion(searchResults)
        })
    }
}

