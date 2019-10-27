# Morphi - Μορφ

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-macos_ios_osx_tvos-lightgrey.svg?style=flat)](https://developer.apple.com/resources/)
[![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)
[![Build Status](https://travis-ci.org/phimage/morphi.svg)](https://travis-ci.org/phimage/morphi)
<a href="https://www.patreon.com/phimage">
<img src="https://c5.patreon.com/external/logo/become_a_patron_button.png" alt="Become a Patron!" height="20">
</a>
<a href="https://paypal.me/ericphimage">
<img src="https://buymecoffee.intm.org/img/button-paypal-white.png" alt="Buy me a coffee" height="20">
</a>

Morphi provides some additional [shapes](https://developer.apple.com/documentation/swiftui/shape) for SwiftUI.

<img align="left" hspace="20" src="/Example/Screen.png" alt="Screen shot" height="333">

- [x] `Triangle`
- [x] `Parallelogram(topLeftAngle)`
- [x] `Polygon(sides)`
- [x] `RoundedPolygon(sides, cornerRadius)`
- [x] `Heart`
- [x] `Moon(angle)`
- [x] `PlusSign(width)`
- [x] `Star(points)`
- [x] `Wave(isUp, width, offset)`
- [x] `SuperEllipse(n)`
- [x] `Drop`
- [x] `Ring(radius)` (to use with a `FillStyle` with `eoFill` equal to `true`)
- [x] `Gear(radius, cogs)` (to use with a `FillStyle` with `eoFill` equal to `true`)

## Examples

### Create a shape view

Like any other shapes just initialize it.

```swift
 Heart().fill(Color.red).frame(width: 100, height: 100)
 ```
 
 <img  src="/Example/Heart.png" alt="Heart" height="128">
 
 ### Mask an existing view
 
 ```swift
 aView.clipShape(Drop())
 // or using static member
 aView.clipShape(.drop)
```

You can even do it on another shape.
```swift
Polygon(sides: 6).fill(Color.red).clipShape(.drop)
```
<img  src="/Example/PolygonDrop.png" alt="PolygonDrop" height="128">

## UIKit

For `UIKit` version with `UIBezierPath` see [IBAnimatable framework](https://github.com/IBAnimatable/IBAnimatable/)
