//
//  Heart.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// An heart centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Heart: Shape {

    public init() {
    }

        /// Describes this shape as a path within a rectangular frame of reference.
        ///
        /// - Parameter rect: The frame of reference for describing this shape.
        /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let (x, y, width, height) = rect.centeredSquare.flatten() //swiftlint:disable:this identifier_name

        let lowerPoint = CGPoint(x: x + width / 2, y: (y + height ))
        path.move(to: lowerPoint)

        path.addCurve(to: CGPoint(x: x, y: (y + (height / 4))),
                 control1: CGPoint(x: (x + (width / 2)), y: (y + (height * 3 / 4))),
                 control2: CGPoint(x: x, y: (y + (height / 2))))

        path.addArc(center: CGPoint(x: (x + (width / 4)), y: (y + (height / 4))),
               radius: (width / 4),
               startAngle: .pi,
               endAngle: .zero,
               clockwise: false)

        path.addArc(center: CGPoint(x: (x + (width * 3 / 4)), y: (y + (height / 4))),
               radius: (width / 4),
               startAngle: .pi,
               endAngle: .zero,
               clockwise: false)

        path.addCurve(to: lowerPoint,
                 control1: CGPoint(x: (x + width), y: (y + (height / 2))),
                 control2: CGPoint(x: (x + (width / 2)), y: (y + (height * 3 / 4))))
        return path
    }

}
