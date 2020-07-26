//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(_ filterString: String) {
        fetchRequest = FetchRequest<Singer>(
            entity: Singer.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "firstName BEGINSWITH[c] %@", filterString)
        )
        
        // result = fe
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList("A")
    }
}
