//
//  MivaClient+Functions.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/25/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

extension MivaClient {
    func requestStoreData(using userData: APIAuth? = nil, _ completionHandler: @escaping (_ response: Result<OrderResponse>) -> Void ) {
        setUserAuthData(with: userData)
        
        MivaClient.shared.mivaPUTRequest { (response) in
            switch response {
            case .Failure(with: let failureString):
                completionHandler(.Failure(with: failureString))
            case .Success(with: let responseData):
                self.parseJson(from: responseData, completionHandler: { (result) in
                    switch result {
                    case .Failure(with: let failureString):
                        completionHandler(.Failure(with: failureString))
                    case .Success(with: let responseJson):
                        let jsonResult = self.checkResponseStatus(of: responseJson)
                        switch jsonResult {
                        case .Failure(with: let failureString):
                            completionHandler(.Failure(with: failureString))
                        case .Success(with: _):
                            completionHandler(.Success(with: responseJson))
                        }
                    }
                })
                
            }
        }
    }
    
    private func parseJson(from data: Data, completionHandler: @escaping (_ result: Result<OrderResponse>) -> Void) {
        let decoder = JSONDecoder()
        do {
            let mivaResponeJson = try decoder.decode(OrderResponse.self, from: data)
            completionHandler(.Success(with: mivaResponeJson))
        } catch {
            completionHandler(.Failure(with: error.localizedDescription))
        }
    }
    
    private func checkResponseStatus(of response: OrderResponse) -> Result<OrderResponse> {
        guard let status = MivaRequestStatus(rawValue: response.success) else {
            fatalError("Should always have respone JSON with a 'success' status")
        }
        
        switch status {
        case .success:
            return .Success(with: response)
        case .failure:
            guard let errorMessage = response.errorMessage else {
                fatalError("Should always have a failure response with an error message")
            }
            
            if let errorDescription = MivaRequestStatus.Errors(rawValue: errorMessage) {
                let failureString: String
                switch errorDescription {
                //TODO: Set up custom language for each error
                case .accessDenied:
                    failureString = errorDescription.rawValue
                case .invalidRequestSignature:
                    failureString = errorDescription.rawValue
                case .missingRequiredTimestamp:
                    failureString = errorDescription.rawValue
                case .timestampOutsideWindow:
                    failureString = errorDescription.rawValue
                case .invalidContentType:
                    failureString = errorDescription.rawValue
                }
                
                return .Failure(with: failureString)
            } else {
                //TODO: Add to error message
                return .Failure(with: errorMessage)
            }
        }
    }
    
    func getRequestBody() -> Data {
        let timeStamp = String(Int64(floor(Date().timeIntervalSince1970)))
        let requestObject = OrderRequest(mivaRequestTimeStamp: timeStamp,
                                         storeCode: userAuthData.storeCode,
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
        httpHeaders[APIConstants.RequestHeaderKeys.Host] = userAuthData.storeUrl
        httpHeaders[APIConstants.RequestHeaderKeys.UserAgent] = APIConstants.RequestHeaderValues.UserAgent
        httpHeaders[APIConstants.RequestHeaderKeys.ContentType] = APIConstants.RequestHeaderValues.ContentType
        httpHeaders[APIConstants.RequestHeaderKeys.Accept] = APIConstants.RequestHeaderValues.Accept
        httpHeaders[APIConstants.RequestHeaderKeys.APIAuthToken] = getAPIAuthToken()
        
        return httpHeaders
    }
    
    private func getAPIAuthToken() -> String {
        let authClient = AuthClient(messageData: jsonRequestData,
                                    apiKey: userAuthData.apiKey,
                                    signatureIsEnabled: userAuthData.signatureIsOn,
                                    signatureKey: userAuthData.signatureKey)
        let token = authClient.getAuthToken()
        return token
    }
}

extension MivaClient {
    private func setUserAuthData(with userData: APIAuth?) {
        if let userData = userData {
            userAuthData = userData
        } else {
            if coreDataUtility.fetchedResultsController == nil {
                coreDataUtility.fetchedResultsController = coreDataUtility.createFetchedResultsController(for: APIAuth.self)
            }
            
            if let apiAuth = coreDataUtility.fetchedResultsController?.fetchedObjects?.first as? APIAuth {
                userAuthData = apiAuth
            } else {
                fatalError("Error getting APIAuth from fetched objects in MivaClient.setUserAuthData")
            }
        }
    }
}
