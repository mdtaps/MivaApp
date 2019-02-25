//
//  Subscription.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Subscription: Decodable {
    let id: Int
    let orderId: Int
    let lineId: Int
    let customerId: Int
    let customerPaymentCardId: Int
    let productId: Int
    let subscriptionTermId: Int
    let addressId: Int
    let shippingId: Int
    let shippingData: String
    let quantity: Int
    let subscriptionsOrdersRemainingThisTerm: Int
    let subscriptionNumberProcessedThisTerm: Int
    let firstSubscriptionOrderDate: Int
    let finalSubscriptionOrderDate: Int
    let nextSubscriptionOrderDate: Int
    let subscriptionStatus: String
    let subscriptionMessage: String
    let subscriptionCancellationDate: Int
    let tax: Double
    let formattedTax: String
    let shipping: Double
    let formattedShipping: String
    let subtotal: Double
    let formattedSubtotal: String
    let total: Double
    let formattedTotal: String
    let method: String
    let productSubscriptionTerm: ProductSubscriptionTerm
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case lineId = "line_id"
        case customerId = "cust_id"
        case customerPaymentCardId = "custpc_id"
        case productId = "product_id"
        case subscriptionTermId = "subterm_id"
        case addressId = "addr_id"
        case shippingId = "ship_id"
        case shippingData = "ship_data"
        case quantity
        case subscriptionsOrdersRemainingThisTerm = "termrem"
        case subscriptionNumberProcessedThisTerm = "termproc"
        case firstSubscriptionOrderDate = "firstdate"
        case finalSubscriptionOrderDate = "lastdate"
        case nextSubscriptionOrderDate = "nextdate"
        case subscriptionStatus = "status"
        case subscriptionMessage = "message"
        case subscriptionCancellationDate = "cncldate"
        case tax
        case formattedTax = "formatted_tax"
        case shipping
        case formattedShipping = "formatted_shipping"
        case subtotal
        case formattedSubtotal = "formatted_subtotal"
        case total
        case formattedTotal = "formatted_total"
        case method
        case productSubscriptionTerm = "productsubscriptionterm"
    }
}
