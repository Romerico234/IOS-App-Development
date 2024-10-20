//
//  PostDetailView.swift
//  PicNix
//
//  Created by Romerico David on 10/19/24.
//

import SwiftUI

struct PostDetailView: View {
    let post: PicNixPost
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .padding()
                }
            }
            VStack(alignment: .leading) {
                Text("Username: \(post.username)")
                Text("Points: \(post.points)")
                AsyncImage(url: URL(string: post.imageUrl))
                    .aspectRatio(contentMode: .fit)
                Text("Restaurant: \(post.restaurantName)")
                Text("Date: \(formattedDate(from: post.timeAgo))")
                Text(post.caption ?? "No Caption for this post")
            }
            .padding()
        }
    }
    
    private func formattedDate(from timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
