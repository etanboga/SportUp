//
//  SearchResultsViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit
class SearchResultsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var searchResultsTableView: UITableView!
    var eventArray = [Event] ()
    var selectedEvent: Event?
    override func viewDidLoad() {
        super.viewDidLoad()
        eventArray.append(Event(eventID: "aaaa", eventName: "ball", creatorID: "creator", eventSport: "ball", eventLocation: "space", creatorContact: "123", emptySpot: 4, time: "7-7.30"))

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventCell
        cell.eventName.text = eventArray[indexPath.row].eventName
        cell.eventLocation.text = eventArray[indexPath.row].eventLocation
        cell.eventSport.text = eventArray[indexPath.row].eventSport
        cell.eventTime.text = eventArray[indexPath.row].time
        cell.emptySpots.text = "Empty Spots: \(eventArray[indexPath.row].emptySpot)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEventDetail", sender: self)
    }
}
