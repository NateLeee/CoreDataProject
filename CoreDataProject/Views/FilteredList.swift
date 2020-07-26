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
    var singers: FetchedResults<Singer> {
        fetchRequest.wrappedValue
    }
    
    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(_ filterKey: String, _ filterString: String) {
        fetchRequest = FetchRequest<Singer>(
            entity: Singer.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey, filterString)
        )
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList("lastName", "A")
    }
}
