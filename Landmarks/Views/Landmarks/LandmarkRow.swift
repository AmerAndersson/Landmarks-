//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-07.
//

import SwiftUI

/// LandmarkRow for displaying details about each landmark.
/// This LandmarkRow view stores information in a property
/// for the landmark it displays, so that one view can display any landmark.
struct LandmarkRow: View {
    /// landmark as a stored 
    /// property of LandmarkRow
    var landmark: Landmark

    var body: some View {
        HStack {
            /// Display an image
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            /// Display name
            Text(landmark.name)

            Spacer()

            /// Test whether the current 
            /// landmark is a favorite
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    /// work with the ModelData object
    let landmarks = ModelData().landmarks
    
    /// Customize the row preview in group
    /// together in a single collection view.
    return Group {
        /// A landmark instance initialization
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

