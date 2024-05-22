//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-05.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    // MARK: - Tab View
    /// That lets the user choose between the category view.
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        // MARK: - Display
        /// when the user makes a selection in the user interface.
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)


            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}
// MARK: - Passes the data object 
/// Down through the environment
#Preview {
    ContentView()
        .environment(ModelData())
}
