//
//  ContentView.swift
//  Example
//
//  Created by 4D on 17/07/2019.
//  Copyright © 2019 phimage. All rights reserved.
//

import SwiftUI
import Morphi

struct ContentView : View {
    var color: Color = .red
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Heart").font(.largeTitle)
                HStack {
                    Heart().fill(color).frame(width: 100, height: 100)
                }
                Text("Drop").font(.largeTitle)
                HStack {
                    Drop().fill(Color.red).frame(width: 100, height: 100)
                }
                Text("Triangle").font(.largeTitle)
                Triangle().fill(color).frame(width: 100, height: 100)
                
                Text("Polygon").font(.largeTitle)
                HStack {
                    Polygon(sides: 5).fill(Color.red).frame(width: 100, height: 100)
                    Polygon(sides: 6).fill(Color.red).frame(width: 100, height: 100)
                    Polygon(sides: 10).fill(Color.red).frame(width: 100, height: 100)
                }
                Text("Star").font(.largeTitle)
                HStack { Star(points: 4).fill(color).frame(width: 100, height: 100)
                    Star(points: 5).fill(color).frame(width: 100, height: 100)
                    Star(points: 8).fill(color).frame(width: 100, height: 100)
                }
            }
            VStack {
                Text("Parallelogram").font(.largeTitle)
                HStack {
                    Parallelogram(topLeftAngle: Angle(degrees: 10)).fill(Color.red).frame(width: 100, height: 100)
                    Parallelogram(topLeftAngle: Angle(degrees: 50)).fill(Color.red).frame(width: 100, height: 100)
                }
                Text("Wave").font(.largeTitle)
                HStack {
                    Wave(isUp: true, width: 50, offset: 10).fill(color).frame(width: 100, height: 100)
                    Wave(isUp: true, width: 10, offset: 10).fill(color).frame(width: 100, height: 100)
                }
            }
            VStack {
                Text("PlusSign").font(.largeTitle)
                HStack {
                    PlusSign(width: 10).fill(Color.red).frame(width: 100, height: 100)
                    PlusSign(width: 30).fill(Color.red).frame(width: 100, height: 100)
                }
                Text("SuperEllipse").font(.largeTitle)
                HStack { SuperEllipse().fill(Color.red).frame(width: 100, height: 100)
                    SuperEllipse(n: 1).fill(Color.red).frame(width: 100, height: 100)
                    SuperEllipse(n: 0.5).fill(Color.red).frame(width: 100, height: 100)
                }
                
            }
            Text("Moon").font(.largeTitle)
            HStack {
                Moon(angle: Angle(degrees: 130)).fill(Color.red).frame(width: 100, height: 100)
                Moon(angle: Angle(degrees: 90)).fill(Color.red).frame(width: 100, height: 100)
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
