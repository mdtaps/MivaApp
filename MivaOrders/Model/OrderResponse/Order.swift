//
//  Order.swift
//  MivaOrders
//
//  Created by Mark Tapia on 2/23/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import Foundation

struct Order: Decodable {
    let orderId: Int
    let paymentModuleId: Int
    let batchId: Int
    let orderStatus: Int
    let paymentStatus: Int
    let stockStatus: Int
    let dateInStock: Int
    let orderDate: Int
    let customerId: Int
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
    let shippingModuleId: Int
    let shippingData: String
    let shippingMethodName: String
    let customerLogin: String
    let customerEmail: String
    let customerBusinessTitle: String
    let paymentModuleName: String
    let orderSource: String
    let orderSourceId: Int
    let orderTotal: Double
    let orderTotalFormatted: String
    let shippingTotal: Double
    let shippingTotalFormatted: String
    let taxTotal: Double
    let taxTotalFormatted: String
    let totalAmountAuthorized: Double
    let totalAmountAuthorizedFormatted: String
    let totalAmountCaptured: Double
    let totalAmountCapturedFormatted: String
    let totalAmountRefunded: Double
    let totalAmountRefundedFormatted: String
    let netCaptured: Double
    let netCapturedFormatted: String
    let pendingItemsCount: Int
    let backorderedItemsCount: Int
    let noteCount: Int
    let customer: Customer
    let items: [Item]
    let charges: [Charge]
    let coupons: [Coupon]
    let discounts: [Discount]
    let payments: [Payment]
    let notes: [Note]
    let customFieldValues: CustomFieldValues
    
    enum CodingKeys: String, CodingKey {
        case orderId = "id"
        case paymentModuleId = "pay_id"
        case batchId = "batch_id"
        case orderStatus = "status"
        case paymentStatus = "pay_status"
        case stockStatus = "stk_status"
        case dateInStock = "dt_instock"
        case orderDate = "orderdate"
        case customerId = "cust_id"
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
        case shippingModuleId = "ship_id"
        case shippingData = "ship_data"
        case shippingMethodName = "ship_method"
        case customerLogin = "cust_login"
        case customerEmail = "cust_pw_email"
        case customerBusinessTitle = "business_title"
        case paymentModuleName = "payment_module"
        case orderSource = "source"
        case orderSourceId = "source_id"
        case orderTotal = "total"
        case orderTotalFormatted = "formatted_total"
        case shippingTotal = "total_ship"
        case shippingTotalFormatted = "formatted_total_ship"
        case taxTotal = "total_tax"
        case taxTotalFormatted = "formatted_total_tax"
        case totalAmountAuthorized = "total_auth"
        case totalAmountAuthorizedFormatted = "formatted_total_auth"
        case totalAmountCaptured = "total_capt"
        case totalAmountCapturedFormatted = "formatted_total_capt"
        case totalAmountRefunded = "total_rfnd"
        case totalAmountRefundedFormatted = "formatted_total_rfnd"
        case netCaptured = "net_capt"
        case netCapturedFormatted = "formatted_net_capt"
        case pendingItemsCount = "pend_count"
        case backorderedItemsCount = "bord_count"
        case noteCount = "note_count"
        case customer
        case items
        case charges
        case coupons
        case discounts
        case payments
        case notes
        case customFieldValues = "CustomField_Values"
    }
}
