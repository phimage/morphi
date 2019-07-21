//
//  ContentView.swift
//  Example
//
//  Created by phimage on 17/07/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import SwiftUI
import Morphi

extension FillStyle {
    static let eoFill = FillStyle(eoFill: true, antialiased: true)
}

struct ShapeIdentifiable<S> : Identifiable{

    var name: String
    var shape: S
    var id: String {
        return self.name + "\(self.shape)"
    }
}

struct ShapesView<S: Shape> : View {
    var name: String
    var shapes: [S]
    var fillColor: Color
    var fillStyle: FillStyle
    
    init(name: String, fillColor: Color = .red, fillStyle: FillStyle = FillStyle(), shapes: [S]) {
        self.name = name
        self.fillStyle = fillStyle
        self.fillColor = fillColor
        self.shapes = shapes
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(shapes.map { ShapeIdentifiable(name: name, shape: $0)}) { shape in
                    return shape.shape.fill(self.fillColor, style: self.fillStyle).frame(width: 100, height: 100).clipShape(.drop)
                }
            }
            Text(name).font(.largeTitle)
        }
    }
}

struct ContentView : View {

    var body: some View {
        ScrollView {
            VStack {
                ShapesView(name: "Heart", shapes: [Heart()])
                ShapesView(name: "Drop", fillColor: .blue, shapes: [Drop()])
                ShapesView(name: "Ring", fillColor: .yellow, fillStyle: .eoFill, shapes: [Ring(radius: 20), Ring(radius: 10)])
                ShapesView(name: "Gear", fillColor: .gray, fillStyle: .eoFill, shapes: [Gear(radius: 20, cogs: 3), Gear(radius: 20, cogs: 8), Gear(radius: 10, cogs: 12)])
                ShapesView(name: "Polygon", shapes: [Polygon(sides: 5), Polygon(sides: 6), Polygon(sides: 10)])
                ShapesView(name: "Triangle", shapes: [Triangle()])
                ShapesView(name: "Star", fillColor: .yellow, shapes: [Star(points: 4), Star(points: 5), Star(points: 8)])
            }
            VStack {
                ShapesView(name: "Parallelogram", shapes: [Parallelogram(topLeftAngle: Angle(degrees: 70)), Parallelogram(topLeftAngle: Angle(degrees: 80))])
                ShapesView(name: "Wave", fillColor: .blue, shapes: [ Wave(isUp: true, width: 50, offset: 10), Wave(isUp: true, width: 10, offset: 10)])
                ShapesView(name: "PlusSign", shapes: [PlusSign(width: 10), PlusSign(width: 30)])
                ShapesView(name: "SuperEllipse", shapes: [SuperEllipse(), SuperEllipse(n: 1), SuperEllipse(n: 0.5)])
                ShapesView(name: "Moon", fillColor: .yellow, shapes: [Moon(angle: Angle(degrees: 130)), Moon(angle: Angle(degrees: 90)), Moon(angle: Angle(degrees: 0))])
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

#if !(swift(>=5.2))
import UIKit
extension UIColor {
    
    static var label: UIColor {
        return .black
    }
}
#endif
