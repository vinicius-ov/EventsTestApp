//
//  AttendeesCollectionViewCell.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class AttendeesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var attendeePic: UIImageView!
    @IBOutlet weak var attendeeName: UILabel!
    var attendee: People! {
        didSet {
            attendeeName.text = attendee.name
            let placeholder = UIImage(named: "placeholder-person")
            if let url = URL(string: attendee.pictureUrl ?? "") {
                attendeePic.af_setImage(withURL: url, placeholderImage: placeholder)
            }
            attendeePic.layer.cornerRadius = attendeePic.frame.size.width / 2
            attendeePic.clipsToBounds = true
        }
    }
}
