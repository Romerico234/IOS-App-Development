import SwiftUI

struct ContentView: View {
    @State private var mainQueueCount: Int = 0
    @State private var globalQueueCount: Int = 0

    var body: some View {
        VStack {
            Text("Main Queue Counter: \(mainQueueCount)")
                .padding()

            Text("Global Queue Counter: \(globalQueueCount)")
                .padding()
        }
        .onAppear {
            // Main Queue Counter
            for i in 1...5 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                    mainQueueCount = i
                }
            }
            // Global Queue Counter
            for i in 1...5 {
                DispatchQueue.global().asyncAfter(deadline: .now() + Double(i)) {
                    globalQueueCount = i
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

