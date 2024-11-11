//
//  MapViewModel.swift
//  LocationTasks
//
//  Created by Romerico David on 11/11/24.
//

import Foundation
import MapKit
import SwiftUI
import Combine

class MapViewModel: NSObject, ObservableObject {
    @Published var region: MKCoordinateRegion
    @Published var selectedCoordinate: IdentifiableCoordinate?
    @Published var annotations: [MKAnnotation] = []
    
    private var taskStore: TaskStore
    private var locationManager: LocationManager
    
    init(taskStore: TaskStore, locationManager: LocationManager) {
        self.taskStore = taskStore
        self.locationManager = locationManager
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        super.init()
        setupBindings()
    }
    
    private func setupBindings() {
        // Update region when location updates
        locationManager.$location.compactMap { $0 }.sink { [weak self] location in
            self?.region.center = location.coordinate
        }.store(in: &cancellables)
        
        // Update annotations when tasks change
        taskStore.$tasks.sink { [weak self] tasks in
            self?.annotations = tasks.map { task in
                let annotation = MKPointAnnotation()
                annotation.coordinate = task.coordinate
                annotation.title = task.name
                return annotation
            }
        }.store(in: &cancellables)
    }
    
    // Handle long-press gesture
    func handleLongPress(at coordinate: CLLocationCoordinate2D) {
        selectedCoordinate = IdentifiableCoordinate(coordinate: coordinate)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
