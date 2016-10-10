//
//  Polish+CoreDataProperties.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 10/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import CoreData


extension Polish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Polish> {
        return NSFetchRequest<Polish>(entityName: "Polish");
    }

    @NSManaged public var color: String?
    @NSManaged public var polishName: String?
    @NSManaged public var type: String?
    @NSManaged public var reference: String?
    @NSManaged public var brand: Brand?

}
