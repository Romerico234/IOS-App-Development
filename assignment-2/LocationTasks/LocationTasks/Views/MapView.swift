//
//  MapView.swift
//  LocationTasks
//
//  Created by Romerico David on 11/10/24.
//

import SwiftUI
import MapKit

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @StateObject private var taskStore = TaskStore()
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel: MapViewModel

    init() {
        let taskStore = TaskStore()
        let locationManager = LocationManager()
        _taskStore = StateObject(wrappedValue: taskStore)
        _locationManager = StateObject(wrappedValue: locationManager)
        _viewModel = StateObject(wrappedValue: MapViewModel(taskStore: taskStore, locationManager: locationManager))
    }

    var body: some View {
        NavigationView {
            MapContainer(viewModel: viewModel)
                .navigationTitle("LocationTasks")
                .navigationBarItems(trailing:
                    NavigationLink(destination: TaskListView().environmentObject(taskStore)) {
                        Text("View Tasks")
                    }
                )
                .sheet(item: $viewModel.selectedCoordinate) { selectedCoord in
                    TaskCreationView(coordinate: selectedCoord.coordinate)
                        .environmentObject(taskStore)
                        .onDisappear {
                            viewModel.selectedCoordinate = nil
                        }
                }
        }
    }
}
