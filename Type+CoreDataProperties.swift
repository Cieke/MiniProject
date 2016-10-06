//
//  Type+CoreDataProperties.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 06/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
import CoreData


extension Type {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Type> {
        return NSFetchRequest<Type>(entityName: "Type");
    }

    @NSManaged public var typeName: String?

}
