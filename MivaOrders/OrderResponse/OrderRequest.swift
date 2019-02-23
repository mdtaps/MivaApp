//
//  OrderRequest.swift
//  MivaOrders
//
//  Created by Mark Tapia on 10/28/18.
//  Copyright © 2018 Mark Tapia. All rights reserved.
//

import Foundation

struct OrdersRequest: Encodable {
    let mivaRequestTimeStamp: String
    let storeCode: String
    let function: String
    let count: Int
    let offset: Int
    let filter: [NameValuePair]
    
    enum CodingKeys: String, CodingKey {
        case mivaRequestTimeStamp = "Miva_Request_Timestamp"
        case storeCode = "Store_Code"
        case function = "Function"
        case count = "Count"
        case offset = "Offset"
        case filter = "Filter"
    }
}

enum NameValuePair {
    case columns(String)
    case searchValues(Expression)
}

extension NameValuePair: Encodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case value
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .searchValues(let expression):
            try container.encode("search", forKey: .name)
            try container.encode(expression, forKey: .value)
        case .columns(let columnName):
            try container.encode("ondemandcolumns", forKey: .name)
            try container.encode(columnName, forKey: .value)
        }
    }
    
    struct Expression: Encodable {
        let field: String
        let `operator`: String
        let value: String
    }
}

