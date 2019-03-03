//
//  MivaClient.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/24/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

import Foundation

public enum Result<T> {
    case Success(with: T)
    case Failure(with: String)
}

class MivaClient {
    static var shared = MivaClient()
    lazy var jsonRequestData: Data = {
        return getRequestBody()
    }()
    
    private init() { }
    
    let session = URLSession.shared
    
    //Miva documentation: https://docs.miva.com/json-api/
    func mivaPUTRequest(with completionHandler: @escaping (_ dataRequest: Result<Data>) -> Void) {
        
        //Set URL
        guard let url = mivaPOSTRequestUrl() else {
            completionHandler(.Failure(with: "Invalid URL"))
            return
            
        }
        
        let request = getMivaRequestFrom(url: url)
        
        //Create task
        let urlTask = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionHandler(.Failure(with: error.localizedDescription))
                return
                
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.Failure(with: "No response from server"))
                return
                
            }
            
            guard response.statusCode == 200 else {
                completionHandler(.Failure(with: "Invalid response from server: \(response.statusCode)"))
                return
                
            }
            
            guard let data = data else {
                completionHandler(.Failure(with: "No data returned with request"))
                return
                
            }
                        
            completionHandler(.Success(with: data))
            
        }
        
        //Run task
        urlTask.resume()
        
    }
    
}

extension MivaClient {
    
    fileprivate func mivaPOSTRequestUrl() -> URL? {
        var components = URLComponents()
        components.scheme = APIConstants.UrlComponents.Scheme
        components.host = APIConstants.UrlComponents.Host
        components.path = APIConstants.UrlComponents.Path
        
        return components.url
    }
    
    fileprivate func getMivaRequestFrom(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = getRequestBody()
        request.allHTTPHeaderFields = getHttpHeaders()
        
        return request
    }
}

extension String {
    func base64lengthCorrected() -> String {
        return self.padding(toLength: ((self.count+3)/4)*4,
                            withPad: "=",
                            startingAt: 0)
    }
}
