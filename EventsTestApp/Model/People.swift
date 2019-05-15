//
//  People.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 15/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class People: Codable {
    
    var id: String?
    var eventId: String?
    var name: String?
    var pictureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case eventId
        case name
        case pictureUrl = "picture"
    }
}
