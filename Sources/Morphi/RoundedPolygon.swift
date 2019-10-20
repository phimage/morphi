//
//  RoundedPolygon.swift
//  
//
//  Created by phimage on 17/07/2019.
//

import SwiftUI

/// Create a Rounded Polygon shape.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct RoundedPolygon: Shape {

    /// Number of polygon side
    public let sides: Int
    public let cornerRadius: CGFloat

    /**
     Create a rounded polygon shape with provided number of sides.
     - Parameter sides: number of sides
     - Parameter cornerRadius: The radius of the polygon corner
     */
    public init(sides: Int, cornerRadius: CGFloat) {
        self.sides = sides
        self.cornerRadius = cornerRadius
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        var angle: CGFloat = -.pi / 2
        let angleIncrement = .pi * 2 / CGFloat(sides)
        let length = min(rect.width, rect.height)
        let radius = length / 2.0 - cornerRadius * .pi / 180.0

        // englobing polygon points
        var points: [CGPoint] = [point(from: angle, radius: radius, offset: center)]
        for _ in 1...sides - 1 {
            angle += angleIncrement
            points.append(point(from: angle, radius: radius, offset: center))
        }

        // configure
        //path.lineCapStyle = .round
       // path.usesEvenOddFillRule = true

        // check cornerRadius
        var cornerRadius = self.cornerRadius

        if cornerRadius < 0 {
            cornerRadius = 0
        } else {
            let maxCornerRadius = points[0].distance(to: points[1]) / 2.0
            if cornerRadius > maxCornerRadius {
                cornerRadius = maxCornerRadius
            }
        }

        // Add arc and lines
        let len = points.count
        path.addArcPoint(previous: points[len - 1], current: points[0 % len], next: points[1 % len], cornerRadius: cornerRadius, isFirst: true)
        for i in 0..<len {
            path.addArcPoint(previous: points[i], current: points[(i + 1) % len], next: points[(i + 2) % len], cornerRadius: cornerRadius, isFirst: false)
        }
        // close path
        path.closeSubpath()

        return path
    }

}

fileprivate extension Path {
    mutating func addArcPoint(previous: CGPoint, current: CGPoint, next: CGPoint, cornerRadius: CGFloat, isFirst: Bool) {
        var c2p = CGPoint(x: previous.x - current.x, y: previous.y - current.y) // current & previous
        var c2n = CGPoint(x: next.x - current.x, y: next.y - current.y) // current & next
        let distanceP = c2p.distance(to: .zero)
        let distanceN = c2p.distance(to: .zero)

        c2p.x /= distanceP
        c2p.y /= distanceP
        c2n.x /= distanceN
        c2n.y /= distanceN

        let ω = acos(c2n.x * c2p.x + c2n.y * c2p.y)
        let θ = (.pi / 2) - (ω / 2)

        let radius = cornerRadius / θ * (.pi / 4)
        let rTanθ = radius * tan(θ)

        if isFirst {
            let end = CGPoint(x: current.x + rTanθ * c2n.x, y: current.y + rTanθ * c2n.y)
            move(to: end)
        } else {
            let start = CGPoint(x: current.x + rTanθ * c2p.x, y: current.y + rTanθ * c2p.y)
            addLine(to: start)

            let center = CGPoint(x: start.x + c2p.y * radius, y: start.y - c2p.x * radius)
            let startAngle = Angle(radians: Double(atan2(c2p.x, -c2p.y)))
            let endAngle = Angle(radians: startAngle.radians + (2 * Double(θ)))
            addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

fileprivate extension CGPoint {

    func distance(to point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }

}
