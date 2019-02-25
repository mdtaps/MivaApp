//
//  Discount.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Discount: Decodable {
    let orderId: Int
    let priceGroupId: Int
    let name: String
    let discountDescription: String
    let total: Double
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case priceGroupId = "pgrp_id"
        case name
        case discountDescription = "descrip"
        case total
    }
}
