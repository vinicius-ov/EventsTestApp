//
//  ApiRequest.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class ApiRequest: ApiRequestDelegate {
    
    func request(withUrl url: String, andParameters params: ParametersApiRequest?, andCompletion completion: @escaping ApiRequestCompletion) {
        completion(nil,nil)
    }
    

}
