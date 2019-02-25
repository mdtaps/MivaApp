//
//  PaymentStatus.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

enum PaymentStatus: Int, CustomStringConvertible {
    case pending = 0
    case authorized = 100
    case captured = 200
    case partiallyCaptured = 201
    
    var description: String {
        switch self {
        case .pending:
            return "Pending"
        case .authorized:
            return "Authorized"
        case .captured:
            return "Captured"
        case .partiallyCaptured:
            return "Partially Captured"
        }
    }
}
