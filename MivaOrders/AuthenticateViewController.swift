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
    
    @IBOutlet weak var storeUrlErrorLabel: UILabel!
    @IBOutlet weak var apiKeyErrorLabel: UILabel!
    @IBOutlet weak var adminPathErrorLabel: UILabel!
    @IBOutlet weak var signatureKeyErrorLabel: UILabel!
    @IBOutlet weak var storeCodeErrorLabel: UILabel!
    //TODO: Add Keyboard listener/delegate for error handling/displaying
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeUrlTextField.delegate = self
        apiKeyTextField.delegate = self
    }
    
    @IBAction func requiredTextFieldDidChange(_ sender: UITextField) {
        
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        submitUserData()
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
        } catch AuthDataError.InvalidApiKeyLength {
            //TODO: Handle error, launch alert
            print("error caught")
            apiKeyErrorLabel.isHidden = false
            apiKeyErrorLabel.text = "apiKeyErrorLabel Error"
            return
        } catch AuthDataError.NoApiKey {
            apiKeyErrorLabel.isHidden = false
            apiKeyErrorLabel.text = "apiKeyErrorLabel Error"
            return
        } catch AuthDataError.InvalidUrlFormat {
            storeUrlErrorLabel.isHidden = false
            apiKeyErrorLabel.text = "storeUrlErrorLabel Error"
            return
        } catch AuthDataError.NoStoreUrl {
            storeUrlTextField.isHidden = false
            apiKeyErrorLabel.text = "storeUrlErrorLabel Error"
            return
        } catch {
            //TODO: Figure out what to do about this error (An unknown error occured)
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        apiKeyErrorLabel.isHidden = true
        storeUrlErrorLabel.isHidden = true
    }
}
