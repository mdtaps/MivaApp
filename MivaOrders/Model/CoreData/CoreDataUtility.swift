//
//  CoreDataUtility.swift
//  MivaOrders
//
//  Created by Mark Tapia on 3/2/19.
//  Copyright © 2019 Mark Tapia. All rights reserved.
//

import UIKit
import CoreData

class CoreDataUtility {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>? {
        didSet {
            if let fc = fetchedResultsController {
                do {
                    try fc.performFetch()
                } catch let e as NSError {
                    print("Error while trying to perform a search: \n\(e)\n\(String(describing: fetchedResultsController))")
                }
            }
        }
    }
    
    func createFetchedResultsController(for managedObject: NSManagedObject.Type) -> NSFetchedResultsController<NSFetchRequestResult> {
        
        //Create fetch request
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = managedObject.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "apiKey", ascending: true)]
        
        //Return fetchedResultsController
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
}


