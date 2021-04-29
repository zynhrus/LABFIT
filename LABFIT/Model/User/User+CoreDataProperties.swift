//
//  User+CoreDataProperties.swift
//  LABFIT
//
//  Created by Sukma Risfa Sam Bima Yudha on 29/04/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var activity: String?
    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var goal: String?
    @NSManaged public var height: Float
    @NSManaged public var name: String?
    @NSManaged public var weight: Float

}

extension User : Identifiable {

}
