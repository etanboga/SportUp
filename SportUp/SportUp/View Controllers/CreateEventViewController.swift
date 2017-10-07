//
//  CreateEventViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class CreateEventViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var selectedSport: String = ""
    var selectedLocation: String = ""

    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var sportsPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
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
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
            return myTitle
        } else {
                let titleData = Constants.locationsArray[row]
                let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor:UIColor.white])
            return myTitle
        }
    }
    
    @IBAction func seeAvailableTimesButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "seeTimes", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! FinishEventCreationViewController
        destinationViewController.eventName = eventNameTextField.text ?? ""
        let sportIndex = sportsPickerView.selectedRow(inComponent: 0)
        
        destinationViewController.selectedSport = Constants.sportsArray[sportIndex]
        let locationIndex = locationPickerView.selectedRow(inComponent: 0)
        destinationViewController.selectedLocation = Constants.locationsArray[locationIndex]
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
