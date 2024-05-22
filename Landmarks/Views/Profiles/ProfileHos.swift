//
//  ProfileHos.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-11.
//

import SwiftUI

/// Displays the username of a stored profile.
/// It will host both a static, summary view
/// of profile information and an edit mode.
/// Add an editMode to read or write the edit scope.
/// Read the user’s profile data from the environment
/// to pass control of the data to the profile host.
struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData

    @State private var draftProfile = Profile.default


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            /// Toggles the environment’s editMode value on and off.
            HStack {
                /// cancel button
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()

            }
            /// The edit profile view displays when user tap Edit
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    /// The model data
    ProfileHost()
        .environment(ModelData())
}
