//
//  ContentView.swift
//  MVC
//
//
//

import SwiftUI

// Model
struct Item {
    let name: String
}

// ViewController
struct ItemListView: View {
    @State private var items: [Item] = []

    var body: some View {
        VStack {
            List(items, id: \.name) { item in
                Text(item.name)
            }
            Button("Add Item") {
                let newItem = Item(name: "New Item")
                items.append(newItem)
            }
        }
    }
}
