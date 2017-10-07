//
//  FinishEventCreationViewController.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class FinishEventCreationViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedSport: String = ""
    var selectedLocation: String = ""
    var eventName: String = ""

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = Constants.timeArray[indexPath.row]
        return cell
    }
    
}
