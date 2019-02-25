//
//  Payment.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Payment: Decodable {
    let id: Int
    let orderId: Int
    let type: Int
    let referenceNumber: String
    let amount: Double
    let formattedAmount: String
    let amountAvailabileForCapture: Double
    let formattedAvailableForCapture: String
    let datestamp: Int
    let expires: Int
    let paymentModuleId: Int
    let paymentEncryptionPassphraseId: Int
    let decryptionStatus: String
    let decryptError: String?
    let description: String
    let paymentData: PaymentData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case type
        case referenceNumber = "refnum"
        case amount
        case formattedAmount = "formatted_amount"
        case amountAvailabileForCapture = "available"
        case formattedAvailableForCapture = "formatted_available"
        case datestamp = "dtstamp"
        case expires
        case paymentModuleId = "pay_id"
        case paymentEncryptionPassphraseId = "pay_secid"
        case decryptionStatus = "decrypt_status"
        case decryptError = "decrypt_error"
        case description
        case paymentData = "data"
    }
}
