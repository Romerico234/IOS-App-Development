//
//  Task.swift
//  LocationTasks
//
//  Created by Romerico David on 11/10/24.
//
import Foundation
import CoreLocation

struct Task: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let dueDate: Date
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    init(id: UUID = UUID(), name: String, description: String, dueDate: Date, coordinate: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.description = description
        self.dueDate = dueDate
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
}

extension Task {
    var dueDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: dueDate)
    }
}
