//
//  AuthenticateViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/31/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit

class AuthenticateViewController: UIViewController {

    @IBOutlet weak var storeUrlTextField: UITextField!
    @IBOutlet weak var apiKeyTextField: UITextField!
    @IBOutlet weak var adminUrlPathTextField: UITextField!
    @IBOutlet weak var signatureKeyTextField: UITextField!
    @IBOutlet weak var storeCodeTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    //TODO: Add Keyboard listener/delegate for error handling/displaying
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func requiredTextFieldDidChange(_ sender: UITextField) {
        
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        if validateUserData() {
            submitUserData()
        }
    }
}

extension AuthenticateViewController {
    private func validateUserData() -> Bool {
        let errorArray: [Error]
        //TODO: Validate store URL
        //TODO: Validate API Key
        //TODO: Validate signature key
        
        return true
    }
    
    private func submitUserData() {
        let authDataModel: AuthDataModel
        do {
            authDataModel = try AuthDataModel(apiKey: apiKeyTextField.text,
                                              storeUrl: storeUrlTextField.text,
                                              signatureKey: signatureKeyTextField.text,
                                              storeCode: storeCodeTextField.text,
                                              adminUrlPath: adminUrlPathTextField.text)
        } catch {
            //TODO: Handle error, launch alert
            fatalError()
        }
        
        
        authDataModel.submitAuthData { result in
            switch result {
            case .Success(with: let orderData):
                //TODO: Launch OrderVC with order data
                print(orderData)
            case .Failure(with: let errorMessage):
                //TODO: Display error in alert view
                fatalError(errorMessage)
            }
        }
    }
}

extension AuthenticateViewController: UITextFieldDelegate {
    
}
