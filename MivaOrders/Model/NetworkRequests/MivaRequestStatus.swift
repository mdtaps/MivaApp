//
//  MivaRequestStatus.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/4/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

enum MivaRequestStatus: Int {
    case failure = 0
    case success = 1
    
    enum Errors: String {
        case accessDenied = "Access denied"
        case invalidRequestSignature = "Invalid request signature"
        case missingRequiredTimestamp = "Missing required timestamp"
        case timestampOutsideWindow = "Timestamp outside configured window"
        case invalidContentType = "Invalid request content type"
    }
}
