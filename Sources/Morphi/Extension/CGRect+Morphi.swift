//
//  File.swift
//  
//
//  Created by 4D on 17/07/2019.
//

import SwiftUI

extension CGRect {
    /// Return the center point.
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    /// Return the diameter of a circle inside this rect.
    var diameter: CGFloat {
        return ceil(min(self.width, self.height))
    }
    /// Return the inner and outer radii
    func radii(for radius: CGFloat) -> (CGFloat, CGFloat) {
        let diameter = self.diameter
        let innerRadius = max(1, diameter / 2 - radius)
        let outerRadius = diameter / 2
        return (innerRadius, outerRadius)
    }

    var centeredSquare: CGRect {
        let width = ceil(min(size.width, size.height))
        let height = width

        let newOrigin = CGPoint(x: origin.x + (size.width - width) / 2, y: origin.y + (size.height - height) / 2)
        let newSize = CGSize(width: width, height: height)
        return CGRect(origin: newOrigin, size: newSize)
    }

    func flatten() -> (CGFloat, CGFloat, CGFloat, CGFloat) { // swiftlint:disable:this large_tuple
        return (origin.x, origin.y, size.width, size.height)
    }
}

// TODO: change angle CGFloat to Angle
func point(from angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
    return CGPoint(x: radius * cos(angle) + offset.x, y: radius * sin(angle) + offset.y)
}
