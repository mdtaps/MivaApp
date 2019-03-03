//
//  ViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/18/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MivaClient.shared.mivaPUTRequest { result in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Handle failure
                print(failureString)
            case .Success(with: let data):
                let decoder = JSONDecoder()
                do {
                    let mivaOrders = try decoder.decode(OrderResponse.self, from: data)
                } catch {
                    //TODO: Handle error
                    print("Error: \(error)")
                }
            }
        }
    }
}

