//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Nate Lee on 7/25/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(
        entity: Ship.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Ship.name, ascending: true)],
        // predicate: NSPredicate(format: "universe == %@", "Star Wars")
        // predicate: NSPredicate(format: "name < %@", "M")
        // predicate: NSPredicate(format: "universe in %@", ["Star Wars", "Aliens"])
        // predicate: NSPredicate(format: "name BEGINSWITH %@", "E")
        // predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")
        predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")
    ) var ships: FetchedResults<Ship>
    
    @State private var firstNameFilterString: String = "S"
    
    var body: some View {
        VStack {
            VStack(spacing: 9) {
                //                List {
                //                    ForEach(ships, id: \.self) { ship in
                //                        Text(ship.name ?? "Unknown Ship")
                //                    }
                //                }
                
                Button("Add Examples") {
                    let taylor = Singer(context: self.moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"
                    
                    let ed = Singer(context: self.moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
                    
                    let adele = Singer(context: self.moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"
                    
                    try? self.moc.save()
                }
                
                Button("Show A") {
                    self.firstNameFilterString = "A"
                }
                
                Button("Show E") {
                    self.firstNameFilterString = "E"
                }
                
                Button("Show T") {
                    self.firstNameFilterString = "T"
                }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
