//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-05.
//

import SwiftUI

struct CircleImage: View {
    /// Pass data into child views a stored image
    var image: Image


    var body: some View {
        /// The image of Turtle Rock
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    /// The image of Turtle Rock
    CircleImage(image: Image("turtlerock"))
}
