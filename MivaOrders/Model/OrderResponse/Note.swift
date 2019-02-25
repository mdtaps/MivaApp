//
//  Note.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Note: Decodable {
    let id: Int
    let customerId: Int
    let businessAccountId: Int
    let orderId: Int
    let noteCreatorUserId: String
    let noteText: String
    let customerLoginUser: String
    let businessAccountName: String
    let noteCreatorUsername: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case customerId = "cust_id"
        case businessAccountId = "account_id"
        case orderId = "order_id"
        case noteCreatorUserId = "user_id"
        case noteText = "notetext"
        case customerLoginUser = "cust_login"
        case businessAccountName = "business_title"
        case noteCreatorUsername = "admin_user"
    }
}
