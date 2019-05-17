//
//  CuponsCollectionViewCell.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 17/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class CuponsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cupomValueLabel: UILabel!
    var cupom: Cupom! {
        didSet {
            cupomValueLabel.text = "\(cupom.discount!)"
        }
    }
}
