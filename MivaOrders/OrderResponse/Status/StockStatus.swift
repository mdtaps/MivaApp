//
//  StockStatus.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

enum StockStatus: Int, CustomStringConvertible {
    case pending = 0
    case inStock = 100
    case outOfStock = 200
    case partiallyInStock = 201
    
    var description: String {
        switch self {
        case .pending:
            return "Pending"
        case .inStock:
            return "In Stock"
        case .outOfStock:
            return "Out of Stock"
        case .partiallyInStock:
            return "Partially in Stock"
        }
    }
}
