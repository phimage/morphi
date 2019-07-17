//
//  Triangle.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// A triangle centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Triangle: Shape {
    public init() {
    }
    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.width / 2.0, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
        path.closeSubpath()
        return path
    }

}
