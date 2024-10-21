//
//  PostDetailView.swift
//  PicNix
//
//  Created by Romerico David on 10/20/24.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Username: \(post.username)")
                Spacer()
                Button(action: { /* Dismiss action */ }) {
                    Image(systemName: "xmark")
                        .padding()
                }
            }
            
            Text("Points: \(post.points)")
            AsyncImage(url: URL(string: post.imageURL))
                .frame(width: 200, height: 200)
            
            Text("Restaurant: \(post.restaurantName)")
            
            Text("Posted on: \(post.formattedTimestamp())")
            
            if let caption = post.caption, !caption.isEmpty {
                Text("Caption: \(caption)")
            } else {
                Text("No Caption for this post")
            }
        }
        .padding()
    }
}

extension Post {
    func formattedTimestamp() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self.timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
