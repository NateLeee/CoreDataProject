//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/25/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16 // year is not optional, which means Core Data will assume a default value for us.

    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}
