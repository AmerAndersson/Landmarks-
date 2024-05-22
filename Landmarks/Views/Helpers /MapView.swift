//
//  MapView.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-06.
//

import SwiftUI
import MapKit

struct MapView: View {
    /// coordinate property
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        /// Binding to a position, which 
        /// is a bidirectional connection to the value
        Map(position: .constant(.region(region)))
    }
    /// Hold the region information for the map
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            /// Pass the coordinate to the center parameter in the region
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
      )
    }
}

#Preview {
    /// Update the preview to pass a fixed coordinate.
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))


}
