//
//  PostListViewModel.swift
//  PicNix
//
//  Created by Romerico David on 10/21/24.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = true

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        guard let url = URL(string: "https://www.jalirani.com/files/picnix.json") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network error: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([Post].self, from: data)

                    DispatchQueue.main.async {
                        self.posts = decodedData
                        self.isLoading = false
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
            }
        }.resume()
    }
}
