//
//  CheckinRequest.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class CheckinRequest: Codable {

    var eventId: String
    var name: String
    var email: String
    
    enum CodingKeys: String, CodingKey{
        case eventId
        case name
        case email
    }
    
    init() {
        eventId = "1"
        name = "ss"
        email = "@"
    }
}
