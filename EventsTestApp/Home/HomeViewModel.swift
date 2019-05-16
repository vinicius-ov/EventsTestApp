//
//  HomeViewModel.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol HomeViewModelProtocol: class {
    var loading: Bool { get }
    var events: [Event] { get }
}

final class HomeViewModel {
    
    var eventsService: EventsServiceDelegate
    var events: [Event] = []
    var error: String = ""
    var selectedEvent: Event?
    
    init(eventsService: EventsServiceDelegate = EventsService()) {
        self.eventsService = eventsService
        eventsService.fetchEvents { result in
            switch result{
                case .success(let events):
                    self.events = events
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
                case .failure(let error):
                    self.error = error.localizedDescription
            }
        }
    }
    
}
