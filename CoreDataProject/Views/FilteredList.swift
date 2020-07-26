//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI
import CoreData


struct FilteredList<T: NSManagedObject, ContentGeneric: View>: View {
    var fetchRequest: FetchRequest<T>
    var results: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    
    let content: (T) -> ContentGeneric
    
    var body: some View {
        List(results, id: \.self) { result in
            // Text("\(result.wrappedFirstName) \(result.wrappedLastName)")
            self.content(result)
        }
    }
    
    init(_ filterKey: String, _ filterString: String, @ViewBuilder content: @escaping (T) -> ContentGeneric) {
        fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey, filterString)
        )
        self.content = content
    }
}
