//
//  PostListView.swift
//  PicNix
//
//  Created by Romerico David on 10/21/24.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()
    @State private var selectedPost: Post?

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.8)
                        ProgressView("Fetching new posts")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.posts) { post in
                                if post.flow == "CORRUPT" {
                                    EmptyView()
                                } else if post.private {
                                    Text("🔒 \(post.username) has their posts set to private.")
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .foregroundColor(.white)
                                        .cornerRadius(12)
                                        .padding(.horizontal)
                                } else {
                                    PostRowView(post: post)
                                        .onTapGesture {
                                            selectedPost = post
                                        }
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("📸 PicNix")
                            .font(.system(size: 30, weight: .bold))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct PostRowView: View {
    var post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("👤 \(post.username)")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text(post.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            AsyncImage(url: URL(string: post.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 250)
                    .overlay(
                        ProgressView()
                    )
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("📍 \(post.businessName)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("⭐️ \(post.amount) points")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)

            Divider()
                .background(Color.gray)
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
