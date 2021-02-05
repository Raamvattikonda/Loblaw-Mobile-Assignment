//
//  NetworkWrapper.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import Foundation
import Alamofire

class Network {
    static let sharedInstance = Network()
    private init() {}
    
    func getTheProductList(completion: @escaping(Products) ->()) {
        let apiRequest = alamofireRequest()
        apiRequest.responseJSON { (response) in
            do {
                guard let responseData = response.data, responseData.count > 0 else {
                    return
                }
                let model = try JSONDecoder().decode(Products.self, from: responseData)
                completion(model)
            } catch {
                print("json decoding failed with error \(error)")
            }
        }
    }
    
    
    private func alamofireRequest() -> DataRequest {
        let urlValue = "https://virtserver.swaggerhub.com/Products-Sample/Products/1.0.0/cart.json"
        let manager = Alamofire.Session.default
        return manager.request(urlValue, method: .get, encoding:  URLEncoding.default, headers: [:])
    }
}
