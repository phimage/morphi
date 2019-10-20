//
//  Shape+StaticMember.swift
//
//
//  Created by phimage on 20/07/2019.
//

import SwiftUI

public struct ShapeMember<Base: Shape> { // old deprecated StaticMember, is there an alternative to discover new type?

    public var base: Base

    /// Creates an instance representing `base`.
    public init(_ base: Base) {
        self.base = base
    }
}

public extension View {

    func clipShape<S>(_ shape: S.Member, style: FillStyle = FillStyle()) -> some View where S: Shape {
        return clipShape(shape.base, style: style)
    }
}

public extension Shape {
    typealias Member = ShapeMember<Self>
}

public extension ShapeMember {
    // MARK: SwiftUI
    static var circle: Circle.Member { return .init(.init()) }
    static var capsule: Capsule.Member { return .init(.init()) }
    static var ellipse: Ellipse.Member { return .init(.init()) }
    static var rectanble: Rectangle.Member { return .init(.init()) }
    static func roundedRectangle(cornerSize: CGSize, style: RoundedCornerStyle = .circular) -> RoundedRectangle.Member {
        return .init(.init(cornerSize: cornerSize, style: style))
    }
    static func roundedRectangle(cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) -> RoundedRectangle.Member {
        return .init(.init(cornerRadius: cornerRadius, style: style))
    }

    // MARK: Morphi
    static var heart: Heart.Member { return .init(.init()) }
    static var drop: Drop.Member { return .init(.init()) }
    static var triangle: Triangle.Member { return .init(.init()) }

    static func superEllipse(n: CGFloat = CGFloat(M_E)) -> SuperEllipse.Member { return .init(.init(n: n)) }
    static func polygon(sides: Int) -> Polygon.Member { return .init(.init(sides: sides)) }
    static func star(points: Int) -> Star.Member { return .init(.init(points: points)) }
    static func ring(radius: CGFloat) -> Ring.Member { return .init(.init(radius: radius)) }
    static func gear(radius: CGFloat, cogs: Int) -> Gear.Member { return .init(.init(radius: radius, cogs: cogs)) }
    static func moon(angle: Angle) -> Moon.Member { return .init(.init(angle: angle)) }
    static func plusSign(width: CGFloat) -> PlusSign.Member { return .init(.init(width: width)) }
    static func wave(isUp: Bool, width: CGFloat, offset: CGFloat) -> Wave.Member { return .init(.init(isUp: isUp, width: width, offset: offset)) }
    static func parallelogram(topLeftAngle: Angle) -> Parallelogram.Member { return .init(.init(topLeftAngle: topLeftAngle)) }
}
