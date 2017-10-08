//
//  FinishEventCreationViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class FinishEventCreationViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var emptySpotsTextField: UITextField!
    var selectedSport: String = ""
    var selectedLocation: String = ""
    var eventName: String = ""
    var timeFrame: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedLocation)
        print(selectedSport)
        print(eventName)
        formatDatePicker()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = Constants.timeArray[indexPath.row]
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
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        let emptySpots: Int =  Int (emptySpotsTextField.text ?? "") ?? 0
        print(eventName)
        print(User.current.uid)
        print(selectedSport)
        print(selectedLocation)
        print(User.current.phoneNumber)
        print(emptySpots)
        print(timeFrame)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yy"
        var selectedDate = dateFormatter.string(from: datePicker.date)
        selectedDate = selectedDate.replacingOccurrences(of: "/", with: "-")
    
       print(selectedDate)
        EventService.createEvent(name: eventName, userID: User.current.uid, sport: selectedSport, location: selectedLocation, contact: User.current.phoneNumber, remainingSpots: emptySpots, time: timeFrame, date: selectedDate, completion: {(returnedEvent) in
        })
        self.navigationController?.popToRootViewController(animated: false)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController : UITabBarController = storyboard.instantiateViewController(withIdentifier: "mainTabBarVC") as! UITabBarController
        mainTabBarController.selectedIndex = 1
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    func formatDatePicker() {
        
        datePicker.datePickerMode = .date
        datePicker.layer.masksToBounds = true
        datePicker.setValue(UIColor(rgb: Constants.whiteishColor), forKey: "textColor")
        datePicker.sizeToFit()
    }
    
}
