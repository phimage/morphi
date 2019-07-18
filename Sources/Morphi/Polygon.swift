//
//  Polygon.swift
//  
//
//  Created by 4D on 17/07/2019.
//

import SwiftUI

/// Create a Polygon shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Polygon: Shape {

    /// Number of polygon side
    public let sides: Int

    /**
     Create a star shape with provided points.
     - Parameter sides: number of sides
     */
    public init(sides: Int) {
        self.sides = sides
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        var angle: CGFloat = -.pi / 2
        let angleIncrement = .pi * 2 / CGFloat(sides)
        let length = min(rect.width, rect.height)
        let radius = length / 2.0

        path.move(to: point(from: angle, radius: radius, offset: center))
        for _ in 1...sides - 1 {
            angle += angleIncrement
            path.addLine(to: point(from: angle, radius: radius, offset: center))
        }

        path.closeSubpath()
        return path
    }

}
