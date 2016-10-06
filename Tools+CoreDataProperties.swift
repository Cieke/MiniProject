//
//  Tools+CoreDataProperties.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 06/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import CoreData


extension Tools {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tools> {
        return NSFetchRequest<Tools>(entityName: "Tools");
    }

    @NSManaged public var brand: String?
    @NSManaged public var name: String?

}
