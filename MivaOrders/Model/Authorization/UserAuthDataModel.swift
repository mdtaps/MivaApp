//
//  UserAuthDataModel.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/2/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit
import CoreData

struct UserAuthDataModel {
    let storeUrl: String
    let apiKey: String
    let signatureKey: String?
    let signatureIsOn: Bool
    let storeCode: String?
    
    init?(storeUrl: String, apiKey: String, signatureKey: String?, signatureIsOn: Bool, storeCode: String?) {
        if signatureIsOn && signatureKey == nil {
            return nil
        }
        
        self.apiKey = apiKey
        self.signatureKey = signatureKey
        self.signatureIsOn = signatureIsOn
        self.storeCode = storeCode
        self.storeUrl = storeUrl
    }
    
    func submit() {
        
        //TODO: Pass UserAuthDataModel instance with request
        MivaClient.shared.requestStoreData { (result) in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Handle failure
                print("Failure")
            case .Success(with: let data):
                print("Success")
            }
        }
        
        //TODO: Move this to another location for saving data to CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "APIAuth", into: appDelegate.stack.context) as? APIAuth else {
            //TODO: Error handling
            fatalError()
        }
        entity.apiKey = apiKey
        entity.signatureKey = signatureKey
        entity.storeCode = storeCode
        entity.signatureIsOn = signatureIsOn
    }
}
