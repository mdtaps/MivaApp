//
//  Item.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let orderId: Int
    let lineId: Int
    let itemStatus: Int
    let subscriptionId: Int
    let subscriptionTermId: Int
    let lastDateInStockTimestamp: Int
    let rmaId: Int
    let itemCode: String
    let itemName: String
    let itemSku: String
    let retailPrice: Double
    let basePrice: Double
    let price: Double
    let weight: Double
    let isTaxable: Bool
    let isUpsold: Bool
    let quantity: Int
    let discounts: [ItemDiscount]?
    let options: [Option]?
    let total: Double
    let shipment: Shipment?
    let subscription: Subscription?
    
    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
        case lineId = "line_id"
        case itemStatus = "status"
        case subscriptionId = "subscrp_id"
        case subscriptionTermId = "subterm_id"
        case rmaId = "rma_id"
        case lastDateInStockTimestamp = "dt_instock"
        case itemCode = "code"
        case itemName = "name"
        case itemSku = "sku"
        case retailPrice = "retail"
        case basePrice = "base_price"
        case price
        case weight
        case isTaxable = "taxable"
        case isUpsold = "upsold"
        case quantity
        case discounts
        case options
        case total
        case shipment
        case subscription
    }

/*
    "order_id": 85554,
    "line_id": 30,
    "status": 0,
    "subscrp_id": 0,
    "subterm_id": 0,
    "rma_id": 0,
    "dt_instock": 0,
    "code": "OrderItemList_Load",
    "name": "OrderItemList_Load Test Product",
    "sku": "",
    "retail": 0,
    "base_price": 100,
    "price": 88,
    "weight": 0,
    "taxable": true,
    "upsold": false,
    "quantity": 1,
    "discounts": [
    {
    "order_id": 85554,
    "line_id": 30,
    "pgrp_id": 2,
    "display": true,
    "descrip": "OrderItemList_Load",
    "discount": 12
    }
    ],
    "options": [
    {
    "attribute": "include_mono",
    "value": "yes",
    "weight": 0,
    "retail": 25,
    "base_price": 25,
    "price": 22,
    "discounts": [
    {
    "order_id": 85554,
    "line_id": 30,
    "attr_id": 1,
    "attmpat_id": 0,
    "pgrp_id": 2,
    "display": true,
    "descrip": "OrderItemList_Load",
    "discount": 3
    }
    ]
    },
    {
    "attribute": "monogram",
    "value": "This is a short monogram",
    "weight": 0,
    "retail": 0,
    "base_price": 0,
    "price": 0
    }
    ],
    "total": 110
 */
}
