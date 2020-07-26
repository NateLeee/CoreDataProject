//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}
