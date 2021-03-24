//
//  DatabaseService.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation
import CoreData

class DatabaseService {
    
    lazy var readCoreData: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    lazy var newCoreData: NSManagedObjectContext = {
        let moc = persistentContainer.newBackgroundContext()
        return moc
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Jobs")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
