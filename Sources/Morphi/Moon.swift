//
//  Star.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// Create a moon shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Moon: Shape {

    public var angle: Angle

    /**
     Create a moon shape with provided angle.
     - Parameter angle: The angle of shape.
     */
    public init(angle: Angle) {
        self.angle = angle
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let radius = ceil(min(rect.width, rect.height) / 2)
        let radian: Angle
        if angle > .zero && angle < .pi {
            radian = -angle
        } else {
            radian = -.pi / 2
        }

        path.addArc(center: .zero, radius: radius, startAngle: -radian / 2, endAngle: radian / 2, clockwise: false)

        if angle > .zero && angle < .pi {
            path.addArc(center: CGPoint(x: radius * cos(CGFloat(radian.radians) / 2.0), y: 0.0),
                        radius: radius * sin(CGFloat(radian.radians) / 2.0), startAngle: .pi / 2, endAngle: -.pi / 2.0, clockwise: true)
        } else {
            path.addLine(to: .zero)
        }

        path.closeSubpath()

        return path.applying(CGAffineTransform(translationX: rect.center.x, y: rect.center.y))
    }

}
