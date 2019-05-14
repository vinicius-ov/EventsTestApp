//
//  HomeViewModel.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol HomeNavigationDelegate: AnyObject {
    func didTapBack()
}

protocol HomeViewModelDelegate: class {
    var loading: Bool { get }
}
    
final class HomeViewModel {

    private var eventsService: EventsServiceDelegate

    
    init(eventsService: EventsServiceDelegate = EventsService()) {
        self.eventsService = eventsService
    }
    
}
