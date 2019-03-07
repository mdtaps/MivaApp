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
    
    func submit() throws {
        if signatureIsOn {
            guard let signatureKey = signatureKey else {
                throw ErrorsToThrow.NoSignatureKeyWhenSignatureIsOn
            }
            
            guard signatureKey.count >= 32 else {
                throw ErrorsToThrow.SignatureKeyNotLongEnough
            }
        }
        
        //TODO: Pass UserAuthDataModel instance with request
        MivaClient.shared.requestStoreData(using: APIAuth()) { (result) in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Handle failure
                print("Failure")
            case .Success(with: let data):
                print("Success")
            }
        }
        
        //TODO: Move this to another location for saving data to CoreData

    }
}

extension UserAuthDataModel {
    enum ErrorsToThrow: Error {
        case NoSignatureKeyWhenSignatureIsOn
        case SignatureKeyNotLongEnough
    }
}
