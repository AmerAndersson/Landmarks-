//
//  PageView.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-13.
//

import SwiftUI

/// A custom view to present UIViewControllerRepresentable view.
/// A @State property in PageView, and pass a binding to this property
/// down to the PageViewController view. The PageViewController updates
/// the binding to match the visible page.
struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 1

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
}
