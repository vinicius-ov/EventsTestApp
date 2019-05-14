//
//  EventsService.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol EventsServiceDelegate: AnyObject {
    func fetchEvents(completion: [Event])
}

final class EventsService: EventsServiceDelegate {
    
    private var delegate: ApiRequestDelegate?
    
    func fetchEvents(completion: [Event]) {
        delegate?.request(withUrl: "", andParameters: [:], andCompletion: { (data, error) in
            //empty
        })
    }
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}
