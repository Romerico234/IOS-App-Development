//
//  ContentView.swift
//  HTTPRequests
//
//  
//

import SwiftUI

struct ContentView: View {
    
    // Why state?
    // How would we know when this is loading?
    @State private var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .bold()
                            .lineLimit(1)
                            .font(.title3)
                        Text(post.body)
                                // how to alter this?
                                .lineLimit(1)
                                .font(.footnote)
                        
                        Text("Post #: \(post.id)")
                    }
                }
            }
            .navigationTitle("JSON Placeholder")
            .onAppear {
                pullPosts()
            }
        }
    }
    
    func pullPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else { return }
            if let data = data {
                do {
                    //Parse JSON
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = decodedData
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
