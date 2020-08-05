//
//  SessionsListTableViewCell.swift
//  Cactus
//
//  Created by dev on 8/5/20.
//  Copyright © 2020 kasymhan. All rights reserved.
//

import UIKit

class SessionsListTableViewCell: UITableViewCell {

    
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var cactusImageView: UIImageView!
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true
    }

    func configure(with session: Session) {
//        let hoursCount = session.durationInSeconds / 60
//        let minutesCount = session.durationInSeconds % 60
//
//        var durationText: String!
//        if hoursCount == 0 {
//            durationText = "\(minutesCount)m"
//        } else if minutesCount == 0 {
//            durationText = "\(hoursCount)h"
//        } else {
//            durationText = "\(hoursCount)h \(minutesCount)m"
//        }
//        durationLabel.text = durationText
//
//        let startDateText = "\(dateFormatter.string(from:session.startDate))"
//        startDateLabel.text = startDateText
        
        let hoursCount = session.durationInSeconds / 60
        let minutesCount = session.durationInSeconds % 60
        
        var durationText: String!
        if hoursCount == 0 {
            durationText = "\(minutesCount)m"
        } else if minutesCount == 0 {
            durationText = "\(hoursCount)h"
        } else {
            durationText = "\(hoursCount)h \(minutesCount)m"
        }
        
        durationLabel.text = durationText
        
        let startDateText = "\(SessionsListTableViewCell.dateFormatter.string(from: session.startDate))"
        startDateLabel.text = startDateText
    }

}
