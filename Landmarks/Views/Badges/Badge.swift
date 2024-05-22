//
//  Badge.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-10.
//

import SwiftUI

/// Combine the badge foreground and background
struct Badge: View {
        /// ForEach view to rotate and display copies of the badge symbol.
        /// A full, 360° rotation split into eight segments
        /// creates a sun-like pattern by repeating the mountain symbol.
        var badgeSymbols: some View {
            ForEach(0..<8) { index in
                RotatedBadgeSymbol(
                    angle: .degrees(Double(index) / Double(8)) * 360.0
                )
            }
            .opacity(0.5)
        }

    var body: some View {
        ZStack {
            BadgeBackground()

            /// Correct the size of the badge symbol
            /// reading the surrounding geometry and scaling the symbol.
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0 ) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}


#Preview {
    Badge()
}
