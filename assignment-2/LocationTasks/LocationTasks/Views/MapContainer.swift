//
//  MapContainer.swift
//  LocationTasks
//
//  Created by Romerico David on 11/11/24.
//

import SwiftUI
import MapKit

struct MapContainer: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel

    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: viewModel)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.isRotateEnabled = true
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true

        let longPressGesture = UILongPressGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handleLongPress(_:))
        )
        longPressGesture.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressGesture)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(viewModel.region, animated: true)

        // Remove existing annotations
        uiView.removeAnnotations(uiView.annotations)

        // Add annotations from the view model
        uiView.addAnnotations(viewModel.annotations)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapContainer
        var viewModel: MapViewModel

        init(_ parent: MapContainer, viewModel: MapViewModel) {
            self.parent = parent
            self.viewModel = viewModel
            super.init()
        }

        @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
            if gestureRecognizer.state == .began {
                let locationInView = gestureRecognizer.location(in: gestureRecognizer.view)
                if let mapView = gestureRecognizer.view as? MKMapView {
                    let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
                    DispatchQueue.main.async {
                        self.viewModel.handleLongPress(at: coordinate)
                    }
                }
            }
        }
    }
}

