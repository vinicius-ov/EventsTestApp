//
//  CheckinService.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 16/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import Foundation

typealias CompletionCheckin = ((ApiResult<CheckinResponse>) -> Void)

protocol CheckinServiceDelegate: AnyObject {
    func sendCheckin(checkinRequest: CheckinRequest, completion: @escaping CompletionCheckin)
}

final class CheckinService {
    let baseUrl = "http://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin/"
    private var delegate: ApiRequestDelegate?
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

extension CheckinService: CheckinServiceDelegate {
    func sendCheckin(checkinRequest: CheckinRequest, completion: @escaping CompletionCheckin) {
        delegate?.sendRequest(withUrl: baseUrl, andParameters: checkinRequest.toDictionary(), andCompletion: { (data, error) in
            guard let jsonData = data, let resp = try? JSONDecoder().decode(CheckinResponse.self, from: jsonData) else{
                completion(ApiResult.failure(ResultError.data(message: "Falha no decode checkin")))
                return
            }
            completion(ApiResult.success(resp))
        })
    }

}
