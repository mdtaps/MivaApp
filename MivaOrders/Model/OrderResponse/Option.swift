//
//  Option.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Option: Decodable {
    let attribute: String
    let value: String
    let weight: String
    let retailPrice: Double
    let basePrice: Double
    let price: Double
    let discounts: [Discount]
    
    enum CodingKeys: String, CodingKey {
        case attribute
        case value
        case weight
        case retailPrice = "retail"
        case basePrice = "base_price"
        case price
        case discounts
    }
    
}
