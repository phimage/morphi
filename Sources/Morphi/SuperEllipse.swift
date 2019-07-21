//
//  SuperEllipse.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// Create a super ellipse shape with provided points.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SuperEllipse: Shape {

    public var n: CGFloat

    public init(n: CGFloat = CGFloat(M_E)) {
        self.n = n
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let a = rect.width / 2
        let b = rect.height / 2
        let n_2 = 2 / n
        let center = rect.center
        let centerLeft = CGPoint(x: rect.origin.x, y: rect.midY)
        path.move(to: centerLeft)

        let x = { (t: CGFloat) -> CGFloat in
            let cost = cos(t)
            return center.x + cost.sign() * a * pow(abs(cost), n_2)
        }

        let y = { (t: CGFloat) -> CGFloat in
            let sint = sin(t)
            return center.y + sint.sign() * b * pow(abs(sint), n_2)
        }

        let factor = max((a + b) / 10, 32)
        for t in stride(from: (-CGFloat.pi), to: CGFloat.pi, by: CGFloat.pi / factor) {
            path.addLine(to: CGPoint(x: x(t), y: y(t)))
        }
        path.closeSubpath()
        return path
    }

}

fileprivate extension CGFloat {

    func sign() -> CGFloat {
        if self < 0 {
            return -1
        } else if self > 0 {
            return 1
        } else {
            return 0
        }
    }
}
