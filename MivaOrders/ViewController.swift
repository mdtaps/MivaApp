//
//  ViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/18/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "APIAuth", into: appDelegate.stack.context) as? APIAuth else {
            //TODO: Error handling
            fatalError()
        }
        entity.apiKey = "7e49a75d33be1ae45fe90cfd6c94123b"
        entity.signatureKey = "TlZ7Xuk3T8Oqonxj422LVcQtfXDGSpEq0c/zJteY5Cg"
        entity.storeCode = "somesock"
        entity.signatureIsOn = true
        entity.storeUrl = "dts3211.mivamerchantdev.com"
        
        MivaClient.shared.requestStoreData(using: entity) { result in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Handle failure
                print(failureString)
            case .Success(with: let responseObject):
                print(responseObject)
            }
        }
    }
    
    enum ErrorsToThrow: Error {
        case NoSignatureKeyWhenSignatureIsOn
        case SignatureKeyNotLongEnough
    }
}

