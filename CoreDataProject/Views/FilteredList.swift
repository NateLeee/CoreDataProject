//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/26/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct FilteredList: View {
    var result: FetchedResults<Singer>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(_ filterString: String) {
        let fetchRequest = FetchRequest<Singer>(
            entity: Singer.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "firstName BEGINSWITH[c] %@", filterString)
        )
        
        // result = fe
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList()
    }
}
