//
//  APIAuth+CoreDataProperties.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/2/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//
//

import Foundation
import CoreData


extension APIAuth {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<APIAuth> {
        return NSFetchRequest<APIAuth>(entityName: "APIAuth")
    }

    @NSManaged public var apiKey: String
    @NSManaged public var signatureIsOn: Bool
    @NSManaged public var signatureKey: String?
    @NSManaged public var storeCode: String?
    @NSManaged public var storeUrl: String

}
