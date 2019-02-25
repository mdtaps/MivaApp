//
//  OrderData.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct OrderData: Decodable {
    let numberOfMatchingOrders: Int?
    let startOffset: Int
    let orders: [Order]
    
    enum CodingKeys: String, CodingKey {
        case numberOfMatchingOrders = "total_count"
        case startOffset = "start_offset"
        case orders = "data"
    }
}
