//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-08.
//

import SwiftUI

/// A favorite button for each landmark
/// A binding controls the storage for a value
struct FavoriteButton: View {
    /// An isSet binding that indicates
    /// the button’s current state.
    @Binding var isSet: Bool

    var body: some View {
        /// Button with an action
        /// that toggles the isSet state
        Button {
            isSet.toggle()
        } label: { /// Toggle Favorite", systemImage: isSet ? "star.fill" : "star"
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    /// provide a constant value
    FavoriteButton(isSet: .constant(true))
}
