//
//  Food+CoreDataProperties.swift
//  LABFIT
//
//  Created by Albert . on 29/04/21.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var calories: Float
    @NSManaged public var idFood: Int64
    @NSManaged public var name: String?
    @NSManaged public var sizeServing: String?
    @NSManaged public var category: String?
    @NSManaged public var image: Data?

}

extension Food : Identifiable {

}
