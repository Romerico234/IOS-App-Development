import SwiftUI

struct ContentView: View {
    @State private var data: String = "No data"

    var body: some View {
        VStack {
            Text("Data from the Network:")
                .font(.title)
                .padding()

            Text(data)
                .padding()
        }
        .onAppear {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
                print("Invalid URL")
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    if let stringData = String(data: data, encoding: .utf8) {
                        DispatchQueue.main.async {
                            self.data = stringData
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

#Preview {
    ContentView()
}
