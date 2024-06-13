//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-10.
//

import SwiftUI

struct CategoryHome: View {
    /// A modelData property it will access
    /// to the categories right now,
    /// as well as to other landmark data later.
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        /// Host the different categories,
        /// and display the categories in Landmarks
        /// The image of the first featured landmark
        NavigationSplitView {
            List {
                /// new page view.
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
