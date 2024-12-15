//
//  Post.swift
//  HTTPRequests
//
//  
//

import Foundation

// Can leave a field out if not needed
struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
