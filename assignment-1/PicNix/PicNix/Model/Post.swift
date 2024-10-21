//
//  Post.swift
//  PicNix
//
//  Created by Romerico David on 10/19/24.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: Int
    var username: String
    var points: Int
    var imageURL: String
    var restaurantName: String
    var timestamp: Int
    var isPrivate: Bool
    var caption: String?
    
    func timeAgo() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self.timestamp))
        let formatter = RelativeDateTimeFormatter()
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
