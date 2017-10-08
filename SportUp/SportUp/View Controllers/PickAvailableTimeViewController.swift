//
//  PickAvailableTimeViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/8/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit
class PickAvailableTimeViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var availableTimeTableView: UITableView!
    var usedTimes = [String] ()
    var availableTimes = [String] ()
    var selectedSport: String = ""
    var selectedLocation: String = ""
    var eventName: String = ""
    var timeFrame: String = ""
    var selectedDate: String = ""
    var emptySpots: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedDate)
        print(selectedLocation)
        print(eventName)
        print(emptySpots)
        print(selectedSport)
        EventService.loadSearchResults(sport: selectedSport, location: selectedLocation) { (searchResults) in
            for result in searchResults {
                if result.date == self.selectedDate {
                    self.usedTimes.append(result.time)
                }
            }
            for time in Constants.timeArray {
                if !self.usedTimes.contains(time) {
                    self.availableTimes.append(time)
                } else {
                    print("Not using: \(time)")
                }
            }
            self.availableTimes = self.availableTimes.sorted()
            self.availableTimeTableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = availableTimes[indexPath.row]
        cell.textLabel?.textColor = UIColor(rgb: Constants.whiteishColor)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)
        timeFrame = currentCell?.textLabel?.text ?? ""
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(rgb: Constants.darkBlue)
        currentCell?.selectedBackgroundView = bgColorView
    }
    
    
}
