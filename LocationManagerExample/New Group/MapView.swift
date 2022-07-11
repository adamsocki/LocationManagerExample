//
//  MapView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 7/9/22.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    var latitude: Double
    var longitude: Double
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        
        let markers = [Location(name: "Event Location", coordinate: coordinate(latitude: latitude, longitude: longitude))]
        
        
        Map(coordinateRegion: $region, annotationItems: markers) { marker in
            MapMarker(coordinate: marker.coordinate)
        }
        
            .onAppear {
                setRegion(latitude: latitude, longitude: longitude)
            }
        
        
    }
    
    private func setRegion(latitude: Double, longitude: Double) {
        
        region = MKCoordinateRegion(
            center: coordinate(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    func coordinate(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
        
        return CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 34.011_286, longitude: -116.166_868)
    }
}
