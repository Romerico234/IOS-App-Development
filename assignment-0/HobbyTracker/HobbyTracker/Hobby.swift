//
//  Hobby.swift
//  HobbyTracker
//
//  Created by Romerico David on 9/29/24.
//

import Foundation

struct Hobby: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var emoji: String
    
    static var preloadedHobbies: [Hobby] {
        return [
            Hobby(name: "Reading", emoji: "📚"),
            Hobby(name: "Swimming", emoji: "🏊‍♀️"),
            Hobby(name: "Gaming", emoji: "🎮"),
            Hobby(name: "Cooking", emoji: "🍳"),
            Hobby(name: "Traveling", emoji: "✈️"),
            Hobby(name: "Drawing", emoji: "🎨"),
            Hobby(name: "Dancing", emoji: "💃"),
            Hobby(name: "Gardening", emoji: "🌱"),
            Hobby(name: "Running", emoji: "🏃‍♂️"),
            Hobby(name: "Writing", emoji: "✍️")
        ]
    }
}
