# Bubbles
[![Language](https://img.shields.io/badge/Swift-3.1-orange.svg?style=flat)](https://swift.org)
[![License](https://img.shields.io/cocoapods/l/SENoiceTable.svg?style=flat)](http://cocoapods.org/pods/Bubbles)
[![Platform](https://img.shields.io/cocoapods/p/SENoiceTable.svg?style=flat)](http://cocoapods.org/pods/Bubbles)

Bubbles is a great new iOS picker written in Swift introduced with the Apple Music App.

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

Connect your new picker through an @IBOutlet
```swift
@IBOutlet weak var bubblesView: CSBubblesView!
```
Finally, in your ```viewDidAppear``` add the following
```swift
self.bubblesView.dataArray = NSMutableArray(array: ["Argentina", "Aruba", "Australia", "Austria", "Bahamas", "Barbados",  "Belgium", "Belize",  "Bermuda",  "Brazil",  "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Dominican Republic", "Egypt", "Faroe Islands", "Fiji",  "France", "Germany", "Greece"])
```

In order to retrive the values that were selected/deselected, use ```NSNotificationCenter```

Add in your ```viewDidLoad``` 
```swift
NotificationCenter.default.addObserver(self, selector: #selector(ViewController.bubbleWasSelected), name: NSNotification.Name(rawValue: "BubbleWasSelected"), object: nil)
NotificationCenter.default.addObserver(self, selector: #selector(ViewController.bubbleWasDeselected), name: NSNotification.Name(rawValue: "BubbleWasDeselected"), object: nil)
```
And implement the methods:
```swift
 func bubbleWasSelected(notification: NSNotification) {
     print(notification.object as! String)
 }
    
 func bubbleWasDeselected(notification: NSNotification) {
     print(notification.object as! String)
 }
    
  ```

## Author

Cristina Sita, cristinasitaa@gmail.com

## License

Bubbles is available under the MIT license. See the LICENSE file for more info.

