//
//  Parallelogram.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// Create a parallelogram shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Parallelogram: Shape {

    public var topLeftAngle: Angle

    public init(topLeftAngle: Angle) {
        self.topLeftAngle = topLeftAngle
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let offset = abs(CGFloat(tan(topLeftAngle.radians - .pi / 2)) * rect.height)

        if topLeftAngle.degrees <= 90 {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width - offset, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: offset, y: rect.height))
        } else {
            path.move(to: CGPoint(x: offset, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - offset, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
        path.closeSubpath()
        return path
    }

}
