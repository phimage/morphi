//
//  Star.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// Create a star shape with provided points.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Star: Shape {

    public let points: Int
    public let borderWidth: CGFloat

    /**
     Create a star shape with provided points.
     - Parameter points: The number of extremity point.
     - Parameter borderWidth: The border width. (default: 0).
     */
    public init(points: Int, borderWidth: CGFloat = 0) {
        //self.init()
        self.points = points
        self.borderWidth = borderWidth
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        // Stars must has at least 3 points.
        var starPoints = points
        if points <= 2 {
            starPoints = 5
        }

        let radius = min(rect.size.width, rect.size.height) / 2 - borderWidth
        let starExtrusion = radius / 2
        let angleIncrement = .pi * 2 / CGFloat(starPoints)
        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        var angle: CGFloat = -.pi / 2
        for _ in 1...starPoints {
            let aPoint = point(from: angle, radius: radius, offset: center)
            let nextPoint = point(from: angle + angleIncrement, radius: radius, offset: center)
            let midPoint = point(from: angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)

            if path.isEmpty {
                path.move(to: aPoint)
            }

            path.addLine(to: midPoint)
            path.addLine(to: nextPoint)
            angle += angleIncrement
        }

        path.closeSubpath()
        return path
    }

}
