//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-05.
//

import SwiftUI

@main
struct LandmarksApp: App {
    /// Initialize state in an app only 
    /// once during the lifetime of the app.
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
            /// passes the data object 
            /// down through the environment
                .environment(modelData)
        }
    }
}
