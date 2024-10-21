//
//  PostDetailView.swift
//  PicNix
//
//  Created by Romerico David on 10/21/24.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var post: Post

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: post.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .clipped()
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 300)
                            .overlay(
                                ProgressView()
                            )
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("👤 \(post.username)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)

                        Text("📍 \(post.businessName)")
                            .font(.title2)
                            .foregroundColor(.white)

                        Text("⭐️ Points: \(post.amount)")
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("🗓️ Date: \(post.formattedDate)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text(post.caption ?? "No Caption for this post")
                            .padding(.top, 8)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            })
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
    }
}
