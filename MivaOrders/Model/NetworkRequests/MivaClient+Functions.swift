//
//  MivaClient+Functions.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/25/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

extension MivaClient {
    
    private func dataFromJSON() -> Data {
        let timeStamp = String(Int64(floor(Date().timeIntervalSince1970)))
        print("TimeStamp:\(timeStamp)")
        let requestObject = OrderRequest(mivaRequestTimeStamp: timeStamp, storeCode: "somesock", function: "OrderList_Load_Query", count: 0, offset: 0, filter: nil)
        
        let encoder = JSONEncoder()        
        do {
            let data = try encoder.encode(requestObject)
            print("My JSON: \(String(data: data, encoding: .utf8)!)")
            return data
        } catch {
            fatalError("There was an error encoding")
        }
    }
    
    func getHttpHeaders(hmac: String) -> [String: String] {
        var httpHeaders = [String: String]()
        httpHeaders[APIConstants.RequestHeaderKeys.Host] = APIConstants.RequestHeaderValues.Host
        httpHeaders[APIConstants.RequestHeaderKeys.UserAgent] = APIConstants.RequestHeaderValues.UserAgent
        httpHeaders[APIConstants.RequestHeaderKeys.ContentType] = APIConstants.RequestHeaderValues.ContentType
        httpHeaders[APIConstants.RequestHeaderKeys.APIAuthToken] = APIConstants.RequestHeaderValues.APIAuthToken + ":" + hmac
        
        return httpHeaders
    }
    
    func getHttpBody() -> Data {
        return dataFromJSON()
    }
}
