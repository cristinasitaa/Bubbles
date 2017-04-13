# Bubbles

[![License](https://img.shields.io/cocoapods/l/SENoiceTable.svg?style=flat)](http://cocoapods.org/pods/Bubbles)
[![Platform](https://img.shields.io/cocoapods/p/SENoiceTable.svg?style=flat)](http://cocoapods.org/pods/Bubbles)

Bubbles is a great new iOS picker introduced with the new Apple Music App written in Swift.

![](https://thumbs.gfycat.com/UncomfortableBelovedAbyssiniangroundhornbill-size_restricted.gif)

## Installation

Bubbles is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Bubbles"
```

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0+

## Usage
To add a new Bubble picker, import Bubbles in your ViewController:
```swift
import Bubbles
```
Add a new view in your .XIB and set the class to ```CSBubblesView```

Change ```Primary Color``` and ```Secondary Color``` from the Attributes Inspector

Connect your new picker to an @IBOutlet
```swift
@IBOutlet weak var bubblesView: CSBubblesView!
```
Finnally, in you ```viewDidAppear``` add the following
```swift
self.bubblesView.dataArray = NSMutableArray(array: ["Argentina", "Aruba", "Australia", "Austria", "Bahamas", "Barbados",  "Belgium", "Belize",  "Bermuda",  "Brazil",  "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Dominican Republic", "Egypt", "Faroe Islands", "Fiji",  "France", "Germany", "Greece"])
```

## Author

Cristina Sita, cristinasitaa@gmail.com

## License

Bubbles is available under the MIT license. See the LICENSE file for more info.

