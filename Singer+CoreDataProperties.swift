//
//  Singer+CoreDataProperties.swift
//  AdvanceSearchBar
//
//  Created by Daichi Morihara on 2022/02/24.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    
    public var wrappedLastName: String {
        lastName ?? "Unknown"
    }
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
