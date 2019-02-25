//
//  ItemDiscount.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/24/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct ItemDiscount: Decodable {
    let orderId: Int
    let lineId: Int
    let priceGroupId: Int
    let isDisplayed: Bool
    let discountDescription: String
    let discountAmount: Double
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case lineId = "line_id"
        case priceGroupId = "pgrp_id"
        case isDisplayed = "display"
        case discountDescription = "descrip"
        case discountAmount = "discount"
    }
}
