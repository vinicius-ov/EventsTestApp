//
//  UIDate+DateFormatter.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 17/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

extension Date{
    func formattedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, EEEE"
        dateFormatter.locale = Locale(identifier:"pt-BR")
        return dateFormatter.string(from: self)
    }
    
    func formattedHour() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier:"pt-BR")
        return dateFormatter.string(from: self)
    }
}
