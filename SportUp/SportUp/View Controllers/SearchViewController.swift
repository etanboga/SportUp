//
//  SearchViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class SearchViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var sportsPickerView: UIPickerView!
    var searchResults = [Event] ()
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == sportsPickerView {
            return Constants.sportsArray.count
        } else {
            return Constants.locationsArray.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView == sportsPickerView {
            let titleData = Constants.sportsArray[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor(rgb: Constants.whiteishColor)])
            return myTitle
        } else {
            let titleData = Constants.locationsArray[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor(rgb: Constants.whiteishColor)])
            return myTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let sportIndex = sportsPickerView.selectedRow(inComponent: 0)
        
        let selectedSport = Constants.sportsArray[sportIndex]
        let locationIndex = locationPickerView.selectedRow(inComponent: 0)
        let selectedLocation = Constants.locationsArray[locationIndex]
        EventService.loadSearchResults(sport: selectedSport, location: selectedLocation) { (resultingEvents) in
            self.searchResults = resultingEvents
            self.performSegue(withIdentifier: "showResults", sender: self)
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SearchResultsViewController
        destinationVC.eventArray = self.searchResults
    }

}
