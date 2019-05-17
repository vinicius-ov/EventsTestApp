//
//  DetailsViewModel.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol DetailsViewModelProtocol: class {
    var loading: Bool { get }
    var checkinRequest: CheckinRequest { get set }
}

final class DetailsViewModel {
    
    var checkinService: CheckinServiceDelegate
    var checkinRequest: CheckinRequest?
    var error: String = ""
    var response: CheckinResponse?
    
    init(checkinService: CheckinServiceDelegate = CheckinService()) {
        self.checkinService = checkinService
    }
    
    func sendCheckin(checkinRequest: CheckinRequest){
        checkinService.sendCheckin(checkinRequest: checkinRequest) { result in
            switch result{
            case .success(let response):
                self.response = response
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateAttendees"), object: nil)
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
}
