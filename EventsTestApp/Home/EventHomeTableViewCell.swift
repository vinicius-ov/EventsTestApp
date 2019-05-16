//
//  EventHomeTableViewCell.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 15/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit
import AlamofireImage

class EventHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    
    @IBOutlet weak var eventDateLabel: UILabel!
    var event: Event! {
        didSet {
            eventTitleLabel.text = event.title
            guard let dateTimestamp = event.date else {
                return
            }
            let date = Date(timeIntervalSince1970: dateTimestamp / 1000.0)
            eventDateLabel.text = date.formattedDate()
            let placeholder = UIImage(named: "mentha-logo")
            eventImage.af_setImage(withURL: URL(string: event.imageUrl!)!, placeholderImage: placeholder)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//TODO: remove from here
extension Date{
    func formattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, EEEE"
        dateFormatter.locale = Locale(identifier:"pt-BR")
        return dateFormatter.string(from: self)
    }
    
    func formattedHour() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.locale = Locale(identifier:"pt-BR")
        return dateFormatter.string(from: self)
    }
    
}
