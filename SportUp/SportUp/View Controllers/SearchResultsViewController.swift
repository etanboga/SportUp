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
        searchResultsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! SearchResultCell
        cell.name.text = eventArray[indexPath.row].eventName
        cell.location.text = eventArray[indexPath.row].eventLocation
        cell.sport.text = eventArray[indexPath.row].eventSport
        cell.time.text = "\(eventArray[indexPath.row].date) @: \(eventArray[indexPath.row].time)"
        cell.emptySpots.text = "Empty Spots: \(eventArray[indexPath.row].emptySpot)"
        return cell
    }
}

