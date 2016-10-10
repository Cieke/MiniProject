//
//  Brand+CoreDataProperties.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 10/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import CoreData


extension Brand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brand> {
        return NSFetchRequest<Brand>(entityName: "Brand");
    }

    @NSManaged public var brandName: String?
    @NSManaged public var polishes: NSSet?

}

// MARK: Generated accessors for polishes
extension Brand {

    @objc(addPolishesObject:)
    @NSManaged public func addToPolishes(_ value: Polish)

    @objc(removePolishesObject:)
    @NSManaged public func removeFromPolishes(_ value: Polish)

    @objc(addPolishes:)
    @NSManaged public func addToPolishes(_ values: NSSet)

    @objc(removePolishes:)
    @NSManaged public func removeFromPolishes(_ values: NSSet)

}
