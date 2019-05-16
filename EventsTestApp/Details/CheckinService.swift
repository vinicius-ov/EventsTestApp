//
//  CheckinService.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import Foundation

typealias CompletionCheckin = ((ApiResult<String>) -> Void)

protocol CheckinServiceDelegate: AnyObject {
    func sendCheckin(completion: @escaping CompletionCheckin)
}

final class CheckinService {
    let baseUrl = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/chekin/"
    private var delegate: ApiRequestDelegate?
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

extension CheckinService: CheckinServiceDelegate {
    func sendCheckin(completion: @escaping CompletionCheckin) {
        let parametersData = try? JSONEncoder().encode(CheckinRequest())
        //guard here
        let parameters = try? JSONSerialization.jsonObject(with: parametersData!, options: .allowFragments) as? [String:Any]
        delegate?.sendRequest(withUrl: baseUrl, andParameters: parameters, andCompletion: { (data, error) in
            completion(ApiResult.success("placeholder string, change"))
        })
    }

}
