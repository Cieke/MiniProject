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

    @NSManaged public var brand: String? // enum?
    
    @NSManaged public var polishName: String? // naam die het merk aan de kleur geeft was eerst gedeclareerd als name
    @NSManaged public var color: String? // naam die je zelf geeft aan je kleur
    @NSManaged public var reference: String?  // mag de key worden
    
    @NSManaged public var type: String? // stamping, glitter...

}
