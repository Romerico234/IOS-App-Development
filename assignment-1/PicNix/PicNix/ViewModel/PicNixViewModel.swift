//
//  PicNixViewModel.swift
//  PicNix
//
//  Created by Romerico David on 10/20/24.
//

import Foundation
import SwiftUI

class PicNixViewModel: ObservableObject {
    @Published var posts: [PicNixPost] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiUrl = "https://www.jalirani.com/files/picnix.json"
    
    func fetchPosts() {
        isLoading = true
        guard let url = URL(string: apiUrl) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Error fetching posts: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self?.errorMessage = "No data returned"
                    return
                }
                
                do {
                    let posts = try JSONDecoder().decode([PicNixPost].self, from: data)
                    self?.posts = posts.filter { !$0.isPrivate }
                } catch {
                    self?.errorMessage = "Error decoding data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
