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
            self.content(result)
        }
    }
    
    init(
        // predicateString: String,
        predicateEnum: Predicate,
        sortDescriptors: [NSSortDescriptor],
        @ViewBuilder content: @escaping (T) -> ContentGeneric) {
        
        var predicateString = ""
        
        switch predicateEnum {
        case .beginsWith(let str):
            predicateString = str
        }
        
        fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            // predicate: NSPredicate(format: predicateString)
            predicate: NSPredicate(format: predicateString)
        )
        self.content = content
    }
}
