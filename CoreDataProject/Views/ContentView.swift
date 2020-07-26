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
    
    @State private var firstNameFilterString: String = "S"
    
    var body: some View {
        VStack {
            VStack(spacing: 9) {
                FilteredList(firstNameFilterString)
                    .padding(.bottom, 27)
                
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
