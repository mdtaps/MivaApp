//
//  OrderResponse.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/24/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import Foundation

struct OrderResponse: Decodable {
    let success: Int
    let errorCode: String?
    let errorMessage: String?
    let validationError: Bool?
    let errorField: String?
    let errorFieldMessage: String?
    let orderData: OrderData?

    enum CodingKeys: String, CodingKey {
        case success
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case validationError = "validation_error"
        case errorField = "error_field"
        case errorFieldMessage = "error_field_message"
        case orderData = "data"
    }
}
