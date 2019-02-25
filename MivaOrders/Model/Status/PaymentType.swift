//
//  PaymentType.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/24/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

enum PaymentType: Int, CustomStringConvertible {
    case declined = 0
    case legacyAuthorization
    case legacyCapture
    case authorization
    case capture
    case authorizationAndCapture
    case refund
    case void
    
    var description: String {
        switch self {
        case .declined:
            return "Declined"
        case .legacyAuthorization:
            return "Legacy Authorization"
        case .legacyCapture:
            return "Legacy Capture"
        case .authorization:
            return "Authorization"
        case .capture:
            return "Capture"
        case .authorizationAndCapture:
            return "Authorization and Capture"
        case .refund:
            return "Refund"
        case .void:
            return "VOID"
            
        }
    }
}
