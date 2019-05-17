//
//  Cupom.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 15/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class Cupom: Codable {
    var id: String?
    var eventId: String?
    var discount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case eventId
        case discount
    }
}
