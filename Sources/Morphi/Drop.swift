//
//  Drop.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// An heart centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Drop: Shape {
    public init() {
    }
    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let (x, y, width, height) = rect.centeredSquare.flatten()

        let topPoint = CGPoint(x: x + width / 2, y: 0)
        path.move(to: topPoint)

        path.addCurve(to: CGPoint(x: x + width / 8, y: (y + (height * 5 / 8))),
                      control1: CGPoint(x: x + width / 2, y: height / 8),
                      control2: CGPoint(x: x + width / 8, y: (y + (height * 3 / 8))))

        path.addArc(center: CGPoint(x: (x + (width / 2)), y: (y + (height * 5 / 8))),
                    radius: (width * 3 / 8),
                    startAngle: .pi,
                    endAngle: .zero,
                    clockwise: true)

        path.addCurve(to: topPoint,
                 control1: CGPoint(x: x + width * 7 / 8, y: (y + (height * 3 / 8))),
                 control2: CGPoint(x: x + width / 2, y: height / 8))
        return path
    }

}
