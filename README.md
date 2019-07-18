# Morphi - Μορφ

Morphi provides some additional shapes for SwiftUI.

<img align="left" hspace="20" src="/Example/Screen.png" alt="Screen shot" height="333">

- [x] `Triangle`
- [x] `Parallelogram(topLeftAngle)`
- [x] `Polygon(sides)`
- [x] `Heart`
- [x] `Moon(angle)`
- [x] `PlusSign(width)`
- [x] `Star(points)`
- [x] `Wave(isUp, width, offset)`
- [x] `SuperEllipse(n)`
- [x] `Drop`
- [x] `Ring(radius)` (to use with a `FillStyle` with `eoFill` equal to `true`)
- [x] `Gear(radius, cogs)` (to use with a `FillStyle` with `eoFill` equal to `true`)

## Example

```swift
 Heart().fill(Color.red).frame(width: 100, height: 100)
 
 aView.clipShape(Drop())
```

## UIKit

For `UIKit` version with `UIBezierPath` see [IBAnimatable framework](https://github.com/IBAnimatable/IBAnimatable/)
