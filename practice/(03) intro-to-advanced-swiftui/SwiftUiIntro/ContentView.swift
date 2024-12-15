//
//  ContentView.swift
//  SwiftUiIntro
//
//  
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var someString:String = ""
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        
        List(people, id: \.self) {
            Text($0)
            
        }
        
        TextField("Placeholder", text: $someString)



        
        
//        Button("Show Sheet") {
//             showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            View1(showingSheet: $showingSheet)
//        }
//
//
//        Button("Show Alert") {
//            showingAlert.toggle()
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Are you sure you want to delete this?"),
//                  message: Text("There is no undo"),
//                  primaryButton: .default(Text("OK")) {
//                print("Deleting...")
//            }, secondaryButton: .cancel())
//        }

        

        
//        NavigationView {
//            NavigationLink(destination: View1()) {
//                    Text("Hello, World!")
//                    .navigationTitle("Navigation")
//                    .navigationBarTitleDisplayMode(.large)
//                }
//        }
    }
}

private extension ContentView {
    
    
    
    
    struct View1: View {
        @Binding var showingSheet: Bool
        
        var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button("X") {
                        showingSheet = false
                    }
                    .padding([.top, .trailing])
                }
               
                Spacer()
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
