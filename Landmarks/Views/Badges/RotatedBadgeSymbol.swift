//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-10.
//

import SwiftUI

/// RotatedBadgeSymbol view to
/// encapsulate the concept of a rotated symbol.
struct RotatedBadgeSymbol: View {
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle:  Angle(degrees: 5))
}
