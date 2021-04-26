//
//  User+CoreDataProperties.swift
//  LABFIT
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: Int16
    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var weight: Float
    @NSManaged public var height: Float
    @NSManaged public var activity: String?

}

extension User : Identifiable {

}
