//
//  EventsService.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import Foundation

typealias CompletionEvents = ((ApiResult<[Event]>) -> Void)

protocol EventsServiceDelegate: AnyObject {
    func fetchEvents(completion: @escaping CompletionEvents)
}

final class EventsService {
    
    private var delegate: ApiRequestDelegate?
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

extension EventsService: EventsServiceDelegate {
    func fetchEvents(completion: @escaping CompletionEvents) {
        delegate?.request(withUrl: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events", andParameters: [:], andCompletion: { (data, error) in
            debugPrint(data)
        })
    }
}
