//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-07.
//

import SwiftUI


struct LandmarkList: View {
    /// read the model data of the current view
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    ///  @State property wrapper to mark a value as state,
    ///  declare the property as private, and give it a default value.

    /// Filtering landmarks.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        /// The dynamically generated list
        ///  by returning a LandmarkRow from the closure.
        /// This creates one LandmarkRow for each element in the landmarks array.
        /// Using collections of Identifiable elements of Landmark:
        NavigationSplitView {
            List {
                /// A control to toggle the state
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                /// filtered of landmarks in the List
                ForEach(filteredLandmarks) { landmark in
                    /// Provide the destination view
                    NavigationLink {
                        /// The current landmark to the destination LandmarkDetail.
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            /// filtering animation
            .animation(.default, value: filteredLandmarks)
            /// The title of the navigation
            /// bar when displaying the list.
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    /// passes the data object down through the environment
    LandmarkList()
        .environment(ModelData())
}
