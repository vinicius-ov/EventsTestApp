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
        //TODO: all parameter constr
        eventId = "1"
        name = "ss"
        email = "@"
    }
    
    func toDictionary() -> [String:Any]? {
        let parametersData = try? JSONEncoder().encode(self)
        //TODO:guard here
        let parameters = try? JSONSerialization.jsonObject(with: parametersData!, options: .allowFragments) as? [String:Any]
        return parameters
    }
}
