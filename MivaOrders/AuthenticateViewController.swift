//
//  AuthenticateViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/31/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit
import CoreData

class AuthenticateViewController: UIViewController {

    @IBOutlet weak var storeUrl: UITextField!
    @IBOutlet weak var apiKey: UITextField!
    @IBOutlet weak var adminUrlPath: UITextField!
    @IBOutlet weak var signatureKey: UITextField!
    @IBOutlet weak var storeCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        //TODO: Check if all required fields are filled
        submitUserData()
    }
    
}

extension AuthenticateViewController {

    func submitUserData() {
        guard let storeUrlValue = storeUrl.text, let apiKeyValue = apiKey.text else {
            //TODO: Launch alert
            return
        }
        
        let adminUrlPathValue = adminUrlPath.text
        let signatureKeyValue = signatureKey.text
        let storeCodeValue = storeCode.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "APIAuth", into: appDelegate.stack.context) as? APIAuth else {
            //TODO: Error handling
            fatalError()
        }
        
        entity.apiKey = apiKeyValue
        entity.signatureKey = signatureKeyValue
        entity.storeCode = storeCodeValue
        entity.signatureIsOn = signatureKeyValue != nil
        entity.storeUrl = storeUrlValue
        entity.urlPath = adminUrlPathValue
        
        MivaClient.shared.requestStoreData { result in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Display failure alert
                fatalError(failureString)
            case .Success(with: let result):
                //TODO: Launch Orders VC
                
                //TODO: Save context
                appDelegate.stack.save()
            }
        }
        
        //
    }
}
