//
//  History+CoreDataProperties.swift
//  LABFIT
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/04/21.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var idHistory: Int64
    @NSManaged public var idFood: Int64
    @NSManaged public var date: Date?

}

extension History : Identifiable {

}
