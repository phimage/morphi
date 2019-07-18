//
//  Gear.swift
//  Morphi
//
//  Created by 4D on 18/07/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import SwiftUI

/// An ring centered on the frame of the view containing it.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Gear: Shape {
    
    /// The radius of the gear ring.
    public var radius: Length
    
    /// Number of cogs. Must be more than 2.
    public var cogs: Int

    public init(radius: Length, cogs: Int) {
        self.radius = radius
        self.cogs = cogs
    }
    
    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = rect.center
        let (innerRadius, outerRadius) = rect.radii(for: radius)

        guard cogs > 2 else {
            return path
        }

        let angle: Angle = .pi / Double(cogs)
        var radius = (outerRadius, innerRadius)
        
        path.addArc(center: .zero, radius: innerRadius / 2, startAngle: .zero, endAngle: .pi * 2, clockwise: true)
        path.move(to: CGPoint(x: radius.0, y: 0))
        
        for _ in 0..<cogs * 2 {
            path.addArc(center: .zero, radius: radius.0, startAngle: .zero, endAngle: -angle, clockwise: true)
            path = path.applying(CGAffineTransform(rotationAngle: CGFloat(angle.radians)))
            swap(&radius.0, &radius.1)
        }

        return path.applying(CGAffineTransform(translationX: center.x, y: center.y))
    }
    
}

