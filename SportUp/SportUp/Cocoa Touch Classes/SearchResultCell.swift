//
//  SearchResultCell.swift
//  SportUp
//
//  Created by Ege Tanboga on 10/7/17.
//  Copyright © 2017 Tanbooz. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    var tapped: ((SearchResultCell) -> Void)?
    @IBAction func contactButtonTapped(_ sender: UIButton) {
        tapped?(self)
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emptySpots: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var sport: UILabel!
    @IBOutlet weak var location: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func callNumber() {
        
        if let phoneCallURL = URL(string: "tel://\(3104294776)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
}
