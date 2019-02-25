//
//  ProductSubscriptionTerm.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/24/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct ProductSubscriptionTerm: Decodable {
    let id: Int
    let productId: Int
    let frequency: String
    let term: Int
    let description: String
    let everyNDaysTerm: Int
    let fixedDayOfTheWeek: Int
    let fixedDayOfTheMonth: Int
    let subscriptionCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case frequency
        case term
        case description = "descrip"
        case everyNDaysTerm = "n"
        case fixedDayOfTheWeek = "fixed_dow"
        case fixedDayOfTheMonth = "fixed_dom"
        case subscriptionCount = "sub_count"
    }
}
