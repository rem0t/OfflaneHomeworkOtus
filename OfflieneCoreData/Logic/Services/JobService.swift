//
//  JobService.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation
import CoreData

protocol JobServiceProtocol {
    
    func readJobs() -> [Jobs]
    func readJob(with identifier: String) -> Jobs?
    func writeJobs(from data: Data, _ completion: @escaping () -> Void)
}


class JobsService: JobServiceProtocol {
    
    private unowned var readCoreData: NSManagedObjectContext
    
    let databaseService: DatabaseService
    
    init(databaseService: DatabaseService){
        self.readCoreData = databaseService.readCoreData
        self.databaseService = databaseService
    }
    
    func readJobs() -> [Jobs] {
        let request = NSFetchRequest<Jobs>(entityName: "Jobs")
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        request.returnsObjectsAsFaults = false
        let result = try? self.readCoreData.fetch(request)
        return result ?? []
    }
    
    func readJob(with identifier: String) -> Jobs? {
        let request = NSFetchRequest<Jobs>(entityName: "Jobs")
        request.predicate = NSPredicate.init(format: "id == %@", argumentArray: [identifier])
        return try? readCoreData.fetch(request).first
    }
    
    func writeJobs(from data: Data, _ completion: @escaping () -> Void){
    
        let writeCoreData = databaseService.newCoreData
        
        do {
            let decoder = JSONDecoder()
            decoder.userInfo[CodingUserInfoKey(rawValue: "managedObjectContext")!] = writeCoreData
            decoder.dateDecodingStrategy = .iso8601
            let contacts = try decoder.decode([Jobs].self, from: data)
            
            let request = NSFetchRequest<Jobs>(entityName: "Jobs")
            let savedContacts: [Jobs] = (try? self.readCoreData.fetch(request)) ?? [Jobs]()
            
            contacts.forEach({ (contact) in
                if let savedContact = savedContacts.first(where: { (savedContact) -> Bool in
                    savedContact.id == contact.id
                }) {
                    savedContact.update(from: contact)
                    writeCoreData.delete(contact)
                }
            })
            
            try writeCoreData.save()
            completion()
            self.readCoreData.perform {
                self.readCoreData.refreshAllObjects()
                completion()
            }
        } catch {
            print(error)
        }
        
    }
}

