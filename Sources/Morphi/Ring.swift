//
//  Ring.swift
//  Morphi
//
//  Created by phimage on 18/07/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import SwiftUI

/// An ring centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Ring: Shape {

    /// The raidus of the ring.
    public var radius: Length

    public init(radius: Length) {
        self.radius = radius
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = rect.center
        let (innerRadius, outerRadius) = rect.radii(for: radius)
        
        path.addArc(center: .zero, radius: innerRadius, startAngle: .zero, endAngle: .pi * 2, clockwise: false)
        
        path.move(to: CGPoint(x: outerRadius, y: 0))
        
        path.addArc(center: .zero, radius: outerRadius, startAngle: .zero, endAngle: .pi * 2, clockwise: false)

        return path.applying(CGAffineTransform(translationX: center.x, y: center.y))
    }

}

