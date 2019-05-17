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
    let baseUrl = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events/"
    private var delegate: ApiRequestDelegate?
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

extension EventsService: EventsServiceDelegate {
    func fetchEvents(completion: @escaping CompletionEvents) {
        delegate?.request(withUrl: baseUrl, andCompletion: { (data, error) in
                guard let jsonData = data, let events = try? JSONDecoder().decode([Event].self, from: jsonData) else{
                    completion(ApiResult.failure(ResultError.data(message: "Falha no decode")))
                    return 
                }
                completion(ApiResult.success(events))
        })
    }
    
    func fetchEvent(byId id: Int, completion: @escaping CompletionEvents) {
        delegate?.request(withUrl: "\(baseUrl)\(id)", andCompletion: { (data, error) in
            guard let jsonData = data, let events = try? JSONDecoder().decode([Event].self, from: jsonData) else{
                completion(ApiResult.failure(ResultError.data(message: "Falha no decode")))
                return
            }
            completion(ApiResult.success(events))
        })
    }
    
}
