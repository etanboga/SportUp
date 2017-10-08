//
//  UpcomingEventsViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class UpcomingEventsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var eventTableView: UITableView!
    var eventArray = [Event] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        EventService.loadUserEvents { (events) in
            self.eventArray = events
            self.eventTableView.reloadData()
        }
        
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

}
