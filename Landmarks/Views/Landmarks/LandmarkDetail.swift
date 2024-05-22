//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-07.
//

import SwiftUI

struct LandmarkDetail: View {
    /// read the model data of the current view
    @Environment(ModelData.self) var modelData

    /// A Landmark property
    var landmark: Landmark

    /// comparing the model data.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        /// A binding controls the storage for a value
        @Bindable var modelData = modelData

        ScrollView {
            /// Custom MapView view
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            /// Custom CircleImage view
            /// Layer the image view on top of the map
            /// An offset -130 points vertically,
            /// padding -130 points from the bottom of the view.
            /// These adjustments make room for the text
            /// by moving the image upwards.
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {

                HStack {
                    Text(landmark.name)
                        .font(.title)
                    /// isSet: $modelData.landmarks[landmarkIndex].isFavorite
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                /// Add a divider
                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            /// Give the navigation bar a title when showing the detail view
            .navigationTitle(landmark.name)
            /// Make the title appear inline
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let modelData = ModelData()
    /// work with the ModelData object
    /// passes the data object down through the environment
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
