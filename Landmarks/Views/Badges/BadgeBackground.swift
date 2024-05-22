//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Amer Andersson on 2024-05-09.
//

import SwiftUI

/// Draw the badge background
struct BadgeBackground: View {
    var body: some View {
        /// GeometryReader so the badge
        /// can use the size of its containing view,
        /// which defines the size instead of hard-coding the value (100).
        GeometryReader { geometry in
            /// Paths to combine lines, curves
            Path { path in
                /// A starting point to the path,
                /// assuming a container with size 100 x 100 px.
                /// Scale the shape on the x-axis using xScale,
                /// and then add xOffset to recenter the shape within its geometry.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale


                /// moves the drawing cursor within
                /// the bounds of a shape as though
                /// an imaginary pen or pencil is hovering
                /// over the area, waiting to start drawing.
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )

                /// Draw the lines for each point
                /// of the shape data to create a rough hexagonal shape.
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )

                    /// Draw the Bézier curves for the badge’s corners
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            /// Background with a gradient to match the design.
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        /// Preserving a 1:1 aspect ratio, the badge
        /// maintains its position at the center of the view,
        /// even if its ancestor views aren’t square.
        .aspectRatio(1, contentMode: .fit)
    }
    /// Background color gradient
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd  = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
