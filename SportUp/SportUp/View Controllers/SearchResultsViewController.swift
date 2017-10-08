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
        cell.tapped = { [unowned self] (selectedCell) -> Void in
            let path = tableView.indexPathForRow(at: selectedCell.center)!
            let selectedItem = self.eventArray[path.row]
            print("the selected item is \(selectedItem.creatorContact)")
            print("the selected item is \(selectedItem.eventName)")
            self.callNumber(phoneNumber: selectedItem.creatorContact)
        }
        return cell
    }
    private func callNumber(phoneNumber: String) {
        
        if let phoneCallURL = URL(string: "tel:\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
}

