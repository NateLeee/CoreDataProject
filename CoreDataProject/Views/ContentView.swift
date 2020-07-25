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
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List {
                ForEach(wizards, id: \.self) { wizard in
                    Text(wizard.name ?? "Unknown Wizard")
                }
            }
            
            
            Button(action: {
                let newWizard = Wizard(context: self.moc)
                newWizard.name = "Jack"
                // self.moc.insert(newWizard) // Is this neccesary?
            }) {
                Text("Add")
            }
            .padding(.bottom, 27)
            
            Button(action: {
                do {
                    try self.moc.save()
                } catch let error {
                    print(error.localizedDescription)
                }
            }) {
                Text("Save")
            }
            .padding(.bottom, 27)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
