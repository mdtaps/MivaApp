//
//  MivaClient+Functions.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/25/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

extension MivaClient {
    func getRequestBody() -> Data {
        let timeStamp = String(Int64(floor(Date().timeIntervalSince1970)))
        let requestObject = OrderRequest(mivaRequestTimeStamp: timeStamp,
                                         storeCode: "somesock",
                                         function: "OrderList_Load_Query",
                                         count: 0,
                                         offset: 0,
                                         filter: nil)
        
        let encoder = JSONEncoder()        
        do {
            let data = try encoder.encode(requestObject)
            return data
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func getHttpHeaders() -> [String: String] {
        var httpHeaders = [String: String]()
        httpHeaders[APIConstants.RequestHeaderKeys.Host] = APIConstants.RequestHeaderValues.Host
        httpHeaders[APIConstants.RequestHeaderKeys.UserAgent] = APIConstants.RequestHeaderValues.UserAgent
        httpHeaders[APIConstants.RequestHeaderKeys.ContentType] = APIConstants.RequestHeaderValues.ContentType
        //TODO:
        httpHeaders[APIConstants.RequestHeaderKeys.APIAuthToken] = getAPIAuthToken()
        
        return httpHeaders
    }
    
    private func getAPIAuthToken() -> String {
        let authClient = AuthClient(messageData: getRequestBody())
        let token = authClient.getAuthToken()
        return token
    }
}
