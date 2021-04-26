//
//  Food+CoreDataProperties.swift
//  LABFIT
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/04/21.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var idFood: Int64
    @NSManaged public var name: String?
    @NSManaged public var calories: Float
    @NSManaged public var carbo: Float
    @NSManaged public var protein: Float
    @NSManaged public var sizeServing: String?

}

extension Food : Identifiable {

}
