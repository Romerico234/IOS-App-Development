import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic
    @State var coffeeSearchResults: [MKMapItem] = []
    var body: some View {
        VStack {
            Map(position: $position) {
                Annotation("Apple", coordinate: CLLocationCoordinate2D(latitude: 37.334722, longitude: -122.008889)) {
                    Image(systemName: "apple.logo")
                        .padding(4)
                        .foregroundStyle(.white)
                }
                
                // Display Markers from Search
                ForEach(coffeeSearchResults, id: \.self) { result in
                    Marker(item: result)
                }
            }
            .mapStyle(.standard)
            //Creating a bottom button
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    Button {
                        searchForCoffee()
                    } label: {
                        Label("Coffee", systemImage: "cup.and.saucer")
                    }
                    Spacer()
                }
                .background(.thinMaterial)
            }
            .onChange(of: coffeeSearchResults) {
                position = .automatic
            }
        }
    }
    
    func searchForCoffee() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "hiking"
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334722, longitude: -122.008889), span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))

        Task {
          let search = MKLocalSearch(request: request)
          let response = try? await search.start()
          coffeeSearchResults = response?.mapItems ?? []
        }
      }
}

#Preview {
    ContentView()
}
