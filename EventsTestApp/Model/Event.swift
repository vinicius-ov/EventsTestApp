//
//  Event.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class Event: Codable {
    
    var id: String?
    var title: String?
    var price: Double?
    var latitude: Double?
    var longitude: Double?
    var imageUrl: String?
    var description: String?
    var date: Int?
    var people: [People]?
    var cupons: [Cupom]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
//        case latitude
//        case longitude
        case imageUrl = "image"
        case description
        case date
        case people
        case cupons
    }
    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        latitude = try values.decode(Double.self, forKey: .latitude)
//        longitude = try values.decode(Double.self, forKey: .longitude)
//    }
    
}
