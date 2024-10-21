//
//  PostListView.swift
//  PicNix
//
//  Created by Romerico David on 10/20/24.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel = PostViewModel()
    @State private var selectedPost: Post?
    @State private var isSheetPresented = false

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Fetching new posts")
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.username)
                                .font(.headline)
                                .onTapGesture {
                                    selectedPost = post
                                    isSheetPresented = true
                                }
                            
                            Text("\(post.points) Points")
                            AsyncImage(url: URL(string: post.imageURL))
                                .frame(width: 100, height: 100)
                            
                            Text(post.restaurantName)
                                .font(.subheadline)
                                .onTapGesture {
                                    selectedPost = post
                                    isSheetPresented = true
                                }
                            
                            Text(post.timeAgo() + " ago")
                        }
                    }
                    .sheet(item: $selectedPost) { post in
                        PostDetailView(post: post)
                    }
                }
            }
            .onAppear {
                viewModel.fetchPosts()
            }
            .navigationTitle("PicNix")
        }
    }
}
