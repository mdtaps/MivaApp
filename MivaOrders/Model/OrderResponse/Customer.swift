//
//  Customer.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Customer: Decodable {
    let customerId: Int
    let businessAccountId: Int
    let username: String
    let email: String
    let shippingId: Int
    let isResidentialAddress: Bool
    let shippingAddressFirstName: String
    let shippingAddressLastName: String
    let shippingAddressEmail: String
    let shippingAddressCompany: String
    let shippingAddressPhone: String
    let shippingAddressFax: String
    let shippingAddressLineOne: String
    let shippingAddressLineTwo: String
    let shippingAddressCity: String
    let shippingAddressState: String
    let shippingAddressZip: String
    let shippingAddressCountry: String
    let billingAddressFirstName: String
    let billingAddressLastName: String
    let billingAddressEmail: String
    let billingAddressCompany: String
    let billingAddressPhone: String
    let billingAddressFax: String
    let billingAddressLineOne: String
    let billingAddressLineTwo: String
    let billingAddressCity: String
    let billingAddressState: String
    let billingAddressZip: String
    let billingAddressCountry: String
    let isTaxExempt: Bool
    let noteCount: Int
    let customerCreatedTimestamp: Int
    let customerLastLoggedInTimestamp: Int
    let customerCredit: Double
    let customerCreditFormatted: String
    
    enum CodingKeys: String, CodingKey {
        case customerId = "id"
        case businessAccountId = "account_id"
        case username = "login"
        case email = "pw_email"
        case shippingId = "ship_id"
        case isResidentialAddress = "ship_res"
        case shippingAddressFirstName = "ship_fname"
        case shippingAddressLastName = "ship_lname"
        case shippingAddressEmail = "ship_email"
        case shippingAddressCompany = "ship_comp"
        case shippingAddressPhone = "ship_phone"
        case shippingAddressFax = "ship_fax"
        case shippingAddressLineOne = "ship_addr1"
        case shippingAddressLineTwo = "ship_addr2"
        case shippingAddressCity = "ship_city"
        case shippingAddressState = "ship_state"
        case shippingAddressZip = "ship_zip"
        case shippingAddressCountry = "ship_cntry"
        case billingAddressFirstName = "bill_fname"
        case billingAddressLastName = "bill_lname"
        case billingAddressEmail = "bill_email"
        case billingAddressCompany = "bill_comp"
        case billingAddressPhone = "bill_phone"
        case billingAddressFax = "bill_fax"
        case billingAddressLineOne = "bill_addr1"
        case billingAddressLineTwo = "bill_addr2"
        case billingAddressCity = "bill_city"
        case billingAddressState = "bill_state"
        case billingAddressZip = "bill_zip"
        case billingAddressCountry = "bill_cntry"
        case isTaxExempt = "tax_exempt"
        case noteCount = "note_count"
        case customerCreatedTimestamp = "dt_created"
        case customerLastLoggedInTimestamp = "dt_login"
        case customerCredit = "credit"
        case customerCreditFormatted = "formatted_credit"
    }
    
/*
    "id": 6,
    "account_id": 0,
    "login": "orderitemlist_load",
    "pw_email": "test@coolcommerce.net",
    "ship_id": 1,
    "ship_res": true,
    "ship_fname": "ccc",
    "ship_lname": "ddd",
    "ship_email": "test@coolcommerce.net",
    "ship_comp": "fff",
    "ship_phone": "111-555-5555",
    "ship_fax": "222-555-1212",
    "ship_addr1": "333 Shoreham Pl",
    "ship_addr2": "Unit 111",
    "ship_city": "aaa",
    "ship_state": "AL",
    "ship_zip": "42127",
    "ship_cntry": "AL",
    "bill_id": 1,
    "bill_fname": "ccc",
    "bill_lname": "ddd",
    "bill_email": "test@coolcommerce.net",
    "bill_comp": "fff",
    "bill_phone": "111-555-5555",
    "bill_fax": "222-555-1212",
    "bill_addr1": "333 Shoreham Pl",
    "bill_addr2": "Unit 111",
    "bill_city": "aaa",
    "bill_state": "AL",
    "bill_zip": "42127",
    "bill_cntry": "AL",
    "note_count": 0,
    "dt_created": 1522701831,
    "dt_login": 0,
    "credit": 0,
    "formatted_credit": "$0.00"
 */
}
