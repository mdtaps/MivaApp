//
//  Coupon.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Coupon: Decodable {
    let orderId: Int
    let couponId: Int
    let code: String
    let description: String
    let total: Double
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case couponId = "coupon_id"
        case code
        case description = "descrip"
        case total
    }
}
