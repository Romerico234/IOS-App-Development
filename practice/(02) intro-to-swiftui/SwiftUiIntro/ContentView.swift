//
//  ContentView.swift
//  SwiftUiIntro
//
// 
//

import SwiftUI

struct ContentView: View {
    
    @State private var birthDate = Date.now
    
    var body: some View {
//            View1()
//            View2()
        NavigationView {
            NavigationLink(destination: View1()) {
                    Text("Hello, World!")
                    .navigationTitle("Navigation")
                    .navigationBarTitleDisplayMode(.large)
                }
        }
    }
}

private extension ContentView {
    struct View1: View {
        var body: some View {
            VStack {
                Text("Example1")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example2")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example3")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example4")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example5")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
            }
        }
    }
    
    struct View2: View {
        var body: some View {
            HStack {
                Text("Example1")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example2")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example3")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example4")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
                Text("Example5")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.green, lineWidth: 4)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
