//
//  ContentView.swift
//  HobbyTracker
//
//  Created by Romerico David on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var hobbies: [Hobby] = Hobby.preloadedHobbies // or = []
    @State private var isPresentingAddHobby = false
    
    var body: some View {
        NavigationView {
            VStack {
                if hobbies.isEmpty {
                    Text("Add a hobby using the ‘+’ button")
                        .foregroundColor(.gray)
                } else {
                    List(hobbies) { hobby in
                        HStack {
                            Text(hobby.emoji)
                            Text(hobby.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Hobby Tracker!")
            .navigationBarItems(trailing: Button(action: {
                isPresentingAddHobby = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isPresentingAddHobby) {
                AddHobbyView(hobbies: $hobbies)
            }
        }
    }
}
