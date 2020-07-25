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
        predicate: NSPredicate(format: "universe in %@", ["Star Wars", "Aliens"])
    ) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            VStack(spacing: 9) {
                List {
                    ForEach(ships, id: \.self) { ship in
                        Text(ship.name ?? "Unknown Ship")
                    }
                }
                
                Button("Add Examples") {
                    let ship1 = Ship(context: self.moc)
                    ship1.name = "Enterprise"
                    ship1.universe = "Star Trek"

                    let ship2 = Ship(context: self.moc)
                    ship2.name = "Defiant"
                    ship2.universe = "Star Trek"

                    let ship3 = Ship(context: self.moc)
                    ship3.name = "Millennium Falcon"
                    ship3.universe = "Star Wars"

                    let ship4 = Ship(context: self.moc)
                    ship4.name = "Executor"
                    ship4.universe = "Star Wars"

                    try? self.moc.save()
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
