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



