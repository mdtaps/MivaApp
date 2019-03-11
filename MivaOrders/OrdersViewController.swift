//
//  OrdersViewController.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/18/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import UIKit
import CoreData

class OrdersViewController: UIViewController {
    var orders: OrderResponse?
    @IBOutlet weak var ordersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let entity = NSEntityDescription.insertNewObject(forEntityName: "APIAuth", into: appDelegate.stack.context) as? APIAuth else {
            //TODO: Error handling
            fatalError()
        }
        entity.apiKey = "7e49a75d33be1ae45fe90cfd6c94123b"
        entity.signatureKey = "v+/TYFqxlQ6pmwK6Gn9WBclGftoquXfQgY3t4luw2t4"
        entity.storeCode = "somesock"
        entity.signatureIsOn = true
        entity.storeUrl = "dts3211.mivamerchantdev.com"
        
        appDelegate.stack.save()
        
        MivaClient.shared.requestStoreData { result in
            switch result {
            case .Failure(with: let failureString):
                //TODO: Throw error
                fatalError(failureString)
            case .Success(with: let result):
                self.orders = result
                DispatchQueue.main.async {
                    self.ordersTableView.reloadData()
                }
            }
        }
        
        ordersTableView.delegate = self
        ordersTableView.dataSource = self

    }
    
    enum OrderError: String, Error {
        case OrderError
    }
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders?.orderData?.numberOfMatchingOrders ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as? OrderTableViewCell else {
            fatalError("Could not find 'orderCell' in tableView cellForRowAtIndexPath")
        }
        
        let index = indexPath.row
        if let orderNumber = orders?.orderData?.orders[index].orderId {
            cell.orderNumber.text = String(orderNumber)
        } else {
            cell.orderNumber.text = "Unknown"
        }
        cell.orderFirstName.text = orders?.orderData?.orders[index].shippingAddressFirstName ?? "Unknown"
        cell.orderLastName.text = orders?.orderData?.orders[index].shippingAddressLastName ?? "Unknown"
        cell.orderAmount.text = orders?.orderData?.orders[index].orderTotalFormatted ?? "Unknown"
        
        return cell
    }
}



