import SwiftUI

@main
struct MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ItemListView(viewModel: ItemListViewModel())
        }
    }
}
