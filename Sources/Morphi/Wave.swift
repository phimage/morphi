//
//  Wave.swift
//  
//
//  Created by 4D on 17/07/2019.
//

import SwiftUI

/// Create a wave shape .
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct Wave: Shape {

    public var isUp: Bool
    public var width: CGFloat
    public var offset: CGFloat

    public init(isUp: Bool, width: CGFloat, offset: CGFloat) {
        self.isUp = isUp
        self.width = width
        self.offset = offset
    }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let originY = isUp ? rect.maxY : rect.minY
        let halfWidth = width / 2.0
        let halfHeight = rect.height / 2.0
        let quarterWidth = width / 4.0

        var isUp = self.isUp
        var startX = rect.minX - quarterWidth - (offset.truncatingRemainder(dividingBy: width))
        var endX = startX + halfWidth

        path.move(to: CGPoint(x: startX, y: originY))
        path.addLine(to: CGPoint(x: startX, y: rect.midY))

        repeat {
             path.addQuadCurve(
                to: CGPoint(x: endX, y: rect.midY),
                control: CGPoint(
                    x: startX + quarterWidth,
                    y: isUp ? rect.maxY + halfHeight : rect.minY - halfHeight)
            )
            startX = endX
            endX += halfWidth
            isUp = !isUp
        } while startX < rect.maxX

        path.addLine(to: CGPoint(x: endX/*path.currentPoint.x*/, y: originY))
        return path
    }

}
