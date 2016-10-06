//
//  Polish+CoreDataProperties.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 06/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import CoreData


extension Polish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Polish> {
        return NSFetchRequest<Polish>(entityName: "Polish");
    }

    @NSManaged public var brand: String?
    @NSManaged public var color: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?

}
