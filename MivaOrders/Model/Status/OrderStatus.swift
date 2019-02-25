//
//  OrderStatus.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/28/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import Foundation

enum OrderStatus: Int, CustomStringConvertible {
    case pending = 0
    case processing = 100
    case shipped = 200
    case partiallyShipped = 201
    case cancelled = 300
    case backordered = 400
    case rmaIssued = 500
    case returned = 600
    
    var description: String {
        switch self {
        case .pending:
            return "Pending"
        case .processing:
            return "Processing"
        case .shipped:
            return "Shipped"
        case .partiallyShipped:
            return "Partially Shipped"
        case .cancelled:
            return "Cancelled"
        case .backordered:
            return "Backordered"
        case .rmaIssued:
            return "RMA Issued"
        case .returned:
            return "Returned"
            
        }
    }
}


