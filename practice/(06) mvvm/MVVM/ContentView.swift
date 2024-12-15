import SwiftUI

// View
struct ItemListView: View {
    @ObservedObject var viewModel: ItemListViewModel

    var body: some View {
        VStack {
            List(viewModel.items, id: \.name) { item in
                Text(item.name)
            }
            Button("Add Item") {
                viewModel.addItem(name: "New Item")
            }
        }
    }
}


// ViewModel
class ItemListViewModel: ObservableObject {
    @Published var items: [Item] = []

    func addItem(name: String) {
        let newItem = Item(name: name)
        items.append(newItem)
    }
}

// Model
struct Item {
    let name: String
}
