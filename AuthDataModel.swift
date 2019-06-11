//
//  AuthDataModel.swift
//  MivaOrders
//
//  Created by Mark Tapia on 4/16/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum AuthDataError: Error {
    case NoApiKey
    case InvalidApiKeyLength
    case InvalidUrlFormat
    case NoStoreUrl
}

struct AuthDataModel {
    let apiKey: String
    let storeUrl: String
    let signatureKey: String?
    let storeCode: String?
    let adminUrlPath: String?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var signatureIsOn: Bool {
        return signatureKey != nil
    }
    
    init(apiKey: String?, storeUrl: String?, signatureKey: String?, storeCode: String?, adminUrlPath: String?) throws {
        //TODO: Look at possibly validating within a separate function
        guard apiKey!.count == 32 else {
            throw AuthDataError.InvalidApiKeyLength
        }
        
        guard apiKey!.count != 0 else {
            throw AuthDataError.NoApiKey
        }
        
        guard storeUrl!.count != 0 else {
            throw AuthDataError.NoStoreUrl
        }
        
        guard storeUrl!.isValidUrl() else {
            throw AuthDataError.InvalidUrlFormat
        }
        
        self.apiKey = apiKey ?? ""
        self.storeUrl = storeUrl ?? ""
        self.signatureKey = signatureKey
        self.storeCode = storeCode
        self.adminUrlPath = adminUrlPath
    }
    
    func submitAuthData(completion: @escaping (Result<OrderResponse>) -> Void) {
        let entity = makeEntity()
        
        MivaClient.shared.requestStoreData(using: entity) { result in
            switch result {
            case .Success(with: let orderData):
                self.appDelegate.stack.save()
                completion(.Success(with: orderData))
            case .Failure(with: let failureString):
                completion(.Failure(with: failureString))
            }
        }
    }
}

extension AuthDataModel {
    static func validate(url: String, apiKey: String) -> Bool {
        if url.isEmpty || apiKey.count < 32 { return false }
        
        if !url.isValidUrl() { return false }
        
        return true
    }
    
    private func makeEntity() -> APIAuth {

        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "APIAuth", into: appDelegate.stack.context) as? APIAuth else {
            //TODO: Error handling
            fatalError()
        }
        
        entity.apiKey = self.apiKey
        entity.signatureKey = self.signatureKey
        entity.storeCode = self.storeCode
        entity.signatureIsOn = self.signatureIsOn
        entity.storeUrl = self.storeUrl
        entity.urlPath = self.adminUrlPath
        
        return entity
    }
}

extension String {
    func isValidUrl() -> Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        
        return !matches.isEmpty
    }
}
