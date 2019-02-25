//
//  Charge.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Charge: Decodable {
    let orderId: Int
    let chargeId: Int
    let moduleId: Int
    let type: String
    let description: String
    let amount: Double
    let displayAmount: Double
    let taxExempt: Bool
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case chargeId = "charge_id"
        case moduleId = "module_id"
        case type
        case description = "descrip"
        case amount
        case displayAmount = "disp_amt"
        case taxExempt = "tax_exempt"
    }
    
}
