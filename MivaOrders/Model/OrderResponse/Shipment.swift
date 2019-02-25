//
//  Shipment.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Shipment: Decodable {
    let id: Int
    let code: String
    let orderId: Int
    let status: Int
    let labelCount: Int
    let shipDate: String
    let trackingNumber: String
    let trackingType: String
    let trackingLink: String
    let weight: Double
    let cost: Double
    let formattedCost: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case orderId = "order_id"
        case status
        case labelCount = "labelcount"
        case shipDate = "ship_date"
        case trackingNumber = "tracknum"
        case trackingType = "tracktype"
        case trackingLink = "tracklink"
        case weight
        case cost
        case formattedCost = "formatted_cost"
    }
}
