//
//  Landmark.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-06.
//

import Foundation
import SwiftUI
import CoreLocation

/// Create a landmark model and conformance to three protocol.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool

    /// The category view displays all categories
    /// in separate rows arranged in a vertical column
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    /// An imageName property to read
    /// the name of the image from the data,
    /// and a computed image property that
    /// loads an image from the asset catalog.

    /// make the property private because
    /// users of the Landmarks structure
    /// care only about the image itself.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    /// It returns the feature image,
    /// if it exists.
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    /// Add a coordinates property to the structure using
    /// a nested Coordinates type that reflects the storage
    /// in the JSON data structure.

    /// Make the property private because
    /// it will use it only to create a public
    /// computed property in the next step.
    private var coordinates: Coordinates

    /// Compute a locationCoordinate property
    /// that’s useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    /// Manage information about the landmark’s location.
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double

    }
}
