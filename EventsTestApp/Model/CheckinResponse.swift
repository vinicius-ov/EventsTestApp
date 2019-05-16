//
//  CheckinResponse.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class CheckinResponse: Codable {
    var code: String
    
    enum CodingKeys: String, CodingKey{
        case code
    }
    
}
