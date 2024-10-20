//
//  HomeView.swift
//  PicNix
//
//  Created by Romerico David on 10/19/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PicNixViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Fetching new posts")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.posts) { post in
                        PostRowView(post: post)
                    }
                }
            }
            .navigationTitle("PicNix")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

struct PostRowView: View {
    let post: PicNixPost
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.username)
                .font(.headline)
            Text("\(post.points) points")
            AsyncImage(url: URL(string: post.imageUrl))
                .aspectRatio(contentMode: .fit)
            Text(post.restaurantName)
            Text("\(timeAgoString(from: post.timeAgo)) ago")
        }
        .padding()
    }
    
    private func timeAgoString(from timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = RelativeDateTimeFormatter()
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
