//
//  Post.swift
//  PicNix
//
//  Created by Romerico David on 10/21/24.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: Int
    var image: String
    var flow: String
    var amount: Int
    var createdAt: String
    var businessName: String
    var businessId: Int
    var username: String
    var userId: Int
    var `private`: Bool
    var caption: String?
    

    var timestamp: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: createdAt)
    }
    
    var timeAgo: String {
        guard let date = timestamp else { return "Unknown time" }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    var formattedDate: String {
        guard let date = timestamp else { return "Unknown date" }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
