//
//  ModelData.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-06.
//

import Foundation
import Observation

@Observable
class ModelData {
    /// Load the landmarks array initialize from landmarkData.json.
    var landmarks: [Landmark] = load("landmarkData.json")
    /// Load the hikes array initialize from
    var hikes: [Hike] = load("hikeData.json")
    /// An instance of the user profile
    var profile = Profile.default

    /// Computed features array, which contains only
    /// the landmarks that have isFeatured set to true.
    var features: [Landmark] {
        landmarks.filter {$0.isFeatured}
    }

    /// A computed categories dictionary,
    /// with category names as keys, and an array of associated landmarks for each key
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}

/// load(_:) method that fetches JSON data with a given name from the app’s main bundle.
/// The load method relies on the return type’s conformance to the Decodable protocol,
/// which is one component of the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder  = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
