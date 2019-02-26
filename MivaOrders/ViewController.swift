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
        
        MivaClient.shared.mivaPUTRequestWith { result in
            switch result {
            case .Failure(with: let failureString):
                print(failureString)
            case .Success(with: let data):
                let jsonString = (String(data: data, encoding: .utf8)!)
                print(jsonString)
                
                let decoder = JSONDecoder()
                do {
                    let mivaOrders = try decoder.decode(OrderResponse.self, from: data)
                    print(mivaOrders)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

