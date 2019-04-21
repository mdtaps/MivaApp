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
    
    init?(apiKey: String?, storeUrl: String?, signatureKey: String?, storeCode: String?, adminUrlPath: String?) {
        guard let apiKey = apiKey, let storeUrl = storeUrl else {
            return nil
        }
        
        self.apiKey = apiKey
        self.storeUrl = storeUrl
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
