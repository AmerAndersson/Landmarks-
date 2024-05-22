//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-13.
//

import SwiftUI

/// displays the landmark’s feature image.
struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

/// Overlay text information
/// about the landmark on the image.
struct TextOverlay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()

        }
        .foregroundStyle(.white)
    }
}
#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2 ,contentMode: .fit)

}
