//
//  Jobs.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation
import CoreData

@objc(Jobs)
public class Jobs: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case createdAt = "created_at"
        case company
        case companyUrl = "company_url"
        case location
        case title
        case desc = "description"
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
    
    required public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey(rawValue: "managedObjectContext")!] as? NSManagedObjectContext else {
             throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        guard let description = NSEntityDescription.entity(forEntityName: "Jobs", in: context) else {
            throw NSEntityDescriptionError.cantCreateDescriptionForEntityName
        }
        
        super.init(entity: description, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? container.decode(String.self, forKey: .id)
        self.type = try? container.decode(String.self, forKey: .type)
        self.url = try? container.decode(String.self, forKey: .url)
        self.createdAt = try? container.decode(String.self, forKey: .createdAt)
        self.company = try? container.decode(String.self, forKey: .company)
        self.companyUrl = try? container.decode(String.self, forKey: .companyUrl)
        self.location = try? container.decode(String.self, forKey: .location)
        self.title = try? container.decode(String.self, forKey: .title)
        self.desc = try? container.decode(String.self, forKey: .desc)
        self.howToApply = try? container.decode(String.self, forKey: .howToApply)
        self.companyLogo = try? container.decode(String.self, forKey: .companyLogo)
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public func update(from new: Jobs) {
        id = new.id
        type = new.type
        url = new.url
        createdAt = new.createdAt
        company = new.company
        companyUrl = new.companyUrl
        location = new.location
        title = new.title
        desc = new.desc
        companyLogo = new.companyLogo
    }
}

extension Jobs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jobs> {
        return NSFetchRequest<Jobs>(entityName: "Jobs")
    }

    @NSManaged public var id: String?
    @NSManaged public var type: String?
    @NSManaged public var url: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var company: String?
    @NSManaged public var companyUrl: String?
    @NSManaged public var location: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var howToApply: String?
    @NSManaged public var companyLogo: String?
}

extension Jobs: Identifiable {

}

extension Jobs {
    
    public var trimmedDescription: String? {
        desc?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
