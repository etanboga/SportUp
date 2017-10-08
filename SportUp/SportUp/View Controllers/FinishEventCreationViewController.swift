//
//  FinishEventCreationViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class FinishEventCreationViewController : UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var emptySpotsTextField: UITextField!
    var selectedSport: String = ""
    var selectedLocation: String = ""
    var eventName: String = ""
    var timeFrame: String = ""
    var selectedDate: String = ""
    var emptySpots: Int = 0
    var usedTimes = [String] ()
    var availableTimes = [String] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedLocation)
        print(selectedSport)
        print(eventName)
        formatDatePicker()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yy"
        var selectedDate = dateFormatter.string(from: datePicker.date)
        selectedDate = selectedDate.replacingOccurrences(of: "/", with: "-")
//        EventService.loadSearchResults(sport: selectedSport, location: selectedLocation) { (searchResults) in
//            for result in searchResults {
//                if result.date == selectedDate {
//                    self.usedTimes.append(result.time)
//                }
//            }
//            for time in Constants.timeArray {
//                if !self.usedTimes.contains(time) {
//                    self.availableTimes.append(time)
//                } else {
//                    print("Not using: \(time)")
//                }
//            }
//            self.availableTimes = self.availableTimes.sorted()
//            self.availableTimeTableView.reloadData()
//        }
        
    }
    
    @IBAction func seeAvailableTimesTapped(_ sender: UIButton) {
        let emptySpotsLocal: Int =  Int (emptySpotsTextField.text ?? "") ?? 0
//        print(eventName)
//        print(User.current.uid)
//        print(selectedSport)
//        print(selectedLocation)
//        print(User.current.phoneNumber)
//        print(emptySpots)
//        print(timeFrame)
        self.emptySpots = emptySpotsLocal
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yy"
        self.selectedDate = dateFormatter.string(from: datePicker.date)
        self.selectedDate = selectedDate.replacingOccurrences(of: "/", with: "-")
        performSegue(withIdentifier: "seeTimes", sender: self)
    
       //print(selectedDate)
    }
    
    func formatDatePicker() {
        
        datePicker.datePickerMode = .date
        datePicker.layer.masksToBounds = true
        datePicker.setValue(UIColor(rgb: Constants.whiteishColor), forKey: "textColor")
        datePicker.sizeToFit()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PickAvailableTimeViewController
        destinationVC.eventName = eventName
        destinationVC.selectedDate = selectedDate
        destinationVC.selectedLocation = selectedLocation
        destinationVC.selectedSport = selectedSport
        destinationVC.emptySpots = emptySpots
    }
}
