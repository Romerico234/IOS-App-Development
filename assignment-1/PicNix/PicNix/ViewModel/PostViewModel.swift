//
//  PostModel.swift
//  PicNix
//
//  Created by Romerico David on 10/19/24.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false

    func fetchPosts() {
        guard let url = URL(string: "https://www.jalirani.com/files/picnix.json") else { return }

        
        self.isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = data {
                    do {
                        var decodedData = try JSONDecoder().decode([Post].self, from: data)
                        decodedData = decodedData.filter { !$0.isPrivate && !self.isCorrupt($0) }
                        self.posts = decodedData
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                } else if let error = error {
                    print("Error fetching posts: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    private func isCorrupt(_ post: Post) -> Bool {
        return post.username.isEmpty || post.restaurantName.isEmpty || post.imageURL.isEmpty
    }
}

