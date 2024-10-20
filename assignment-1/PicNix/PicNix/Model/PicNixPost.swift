//
//  PicNixPost.swift
//  PicNix
//
//  Created by Romerico David on 10/19/24.
//

import Foundation

struct PicNixPost: Identifiable, Codable {
    let id: String
    let username: String
    let points: Int
    let imageUrl: String
    let restaurantName: String
    let timeAgo: Double
    let caption: String?
    let isPrivate: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, username, points
        case imageUrl = "image"
        case restaurantName = "restaurant"
        case timeAgo = "timestamp"
        case caption, isPrivate
    }
}
