//
//  AuthenticateViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/31/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit

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
        submitUserData()
    }
    
}

extension AuthenticateViewController {
    func submitUserData() {
        
    }
}
