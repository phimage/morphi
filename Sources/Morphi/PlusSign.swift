//
//  PlusSign.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// A plus sign centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlusSign: Shape {

    public var signWidth: CGFloat

    public init(width signWidth: CGFloat) {
        self.signWidth = signWidth
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let (x, y, width, height) = rect/*.centeredSquare*/.flatten()
        if signWidth > width {
            return path
        }
        let midX = x + width / 2
        let midY = y + height / 2
        let right = x + width
        let left = x
        let top = y
        let bottom = y + height

        path.move(to: CGPoint(x: midX - signWidth / 2, y: top))
        path.addLine(to: CGPoint(x: midX + signWidth / 2, y: top))
        path.addLine(to: CGPoint(x: midX + signWidth / 2, y: midY - signWidth / 2))
        path.addLine(to: CGPoint(x: right, y: midY - signWidth / 2))
        path.addLine(to: CGPoint(x: right, y: midY + signWidth / 2))
        path.addLine(to: CGPoint(x: midX + signWidth / 2, y: midY + signWidth / 2))
        path.addLine(to: CGPoint(x: midX + signWidth / 2, y: bottom))
        path.addLine(to: CGPoint(x: midX - signWidth / 2, y: bottom))
        path.addLine(to: CGPoint(x: midX - signWidth / 2, y: midY + signWidth / 2))
        path.addLine(to: CGPoint(x: left, y: midY + signWidth / 2))
        path.addLine(to: CGPoint(x: left, y: midY - signWidth / 2))
        path.addLine(to: CGPoint(x: midX - signWidth / 2, y: midY - signWidth / 2))
        path.addLine(to: CGPoint(x: midX - signWidth / 2, y: top))
        return path
    }

}
