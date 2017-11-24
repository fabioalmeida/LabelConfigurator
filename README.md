# LabelConfigurator

[![CI Status](http://img.shields.io/travis/fabioalmeida/LabelConfigurator.svg?style=flat)](https://travis-ci.org/fabioalmeida/LabelConfigurator)
[![Version](https://img.shields.io/cocoapods/v/LabelConfigurator.svg?style=flat)](http://cocoapods.org/pods/LabelConfigurator)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/LabelConfigurator.svg?style=flat)](http://cocoapods.org/pods/LabelConfigurator)
[![Platform](https://img.shields.io/cocoapods/p/LabelConfigurator.svg?style=flat)](http://cocoapods.org/pods/LabelConfigurator)


LabelConfigurator is a compact library for iOS designed to help configuring [UILabels](https://developer.apple.com/documentation/uikit/uilabel) without the usual burden of setting all the text attributes in several steps, specially when we have substrings with different attributes.

It was created using a [Builder Pattern](https://en.wikipedia.org/wiki/Builder_pattern) to allow adding several attributes to a single label, but just setting all them at once when needed. The interface itself is very easy and straightforward, making this library adoption super fast. For more detailed examples please check the [Usage](#usage) section.


## Requirements

The minimum requirements needed to use `LabelConfigurator` are:
- iOS 9.0
- Xcode 8
- Obj-C and Swift compatible


## Installation

### CocoaPods

You can use [CocoaPods](http://cocoapods.org) to add `LabelConfigurator` to your project. To install it, simply specify it in your **Podfile**:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'TargetName' do
  pod 'LabelConfigurator', '~> 0.3.0'
end
```

After specifying the new dependency on the Podfile, just run `pod install` to make sure you install the latest version of the library.


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate `LabelConfigurator` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "fabioameida/LabelConfigurator" ~> 0.3.0
```

Run `carthage update` to build the framework and drag the built `LabelConfigurator.framework` into your Xcode project.


## Usage

To import the library to your project just add the following line to your Swift file:

```swift
import LabelConfigurator
```

If you want to make a really simple [UIFont](https://developer.apple.com/documentation/uikit/uifont) and text color to your label, just add the following code:

```swift
self.myLabel.setLabelText("Some text")
            .set(font: UIFont.boldSystemFont(ofSize: 14))
            .set(textColor: .blue)
            .configure()
```

Please notice two important aspects about the previous code:
1. The first method being called is `setLabelText()`, which returns the `UILabelBuilder` that allows you to add all the needed attributes to the UILabel without any boilerplate code;
2. After adding all the attributes you just need call `configure()` at the end, which will apply all the defined attributes to the UILabel.

The previous code may look quite similar to the `UIKit` code you write to just change the font and text color. But when it comes to other common cases like setting a custom **Font Tracking** or **Line Spacing**, the case is different because that will imply creating an [NSAttributedString](https://developer.apple.com/documentation/foundation/nsattributedstring).

To achieve this with `LabelConfigurator` you just need to do the following:

```swift
self.myLabel.setLabelText("Some text \n Other text")
            .set(font: UIFont.boldSystemFont(ofSize: 14))
            .set(textColor: .blue)
            .set(fontTracking: 4)
            .set(lineSpacing: 10)
            .configure()
```

Other common example is adding different text attributes to a substring. Now, you can do it like this:

```swift
let minimumAmount = "$5"

self.myLabel.setLabelText("Please donate \(minimumAmount) or more!")
            .set(font: UIFont.systemFont(ofSize: 12))
            .set(textColor: .black)
            .set(font: UIFont.boldSystemFont(ofSize: 13), onSubstring: minimumAmount)
            .set(textColor: .red, onSubstring: minimumAmount)
            .configure()
```


## Advanced Usage

The most common customisations done on `UILabels` are covered with helper methods to allow you adding attributes as easily as possible as you can see on the previous examples.

However, not all the possibilities are covered (and we want to keep it that way) on `UILabel` attributes and also `NSAttributedString`.

The good this is that you can add your custom attributes you wanted to add to your `NSAttributedString` using two convenience methods to do so:
- `func set(attribute: NSAttributedStringKey, value: Any, onSubstring substring: String)`
- `func set(attribute: NSAttributedStringKey, value: Any, onRange range: NSRange)`

For example, if you want to add a strikethrough attribute to a substring on your `UILabel`, you can do as the following

```swift
let oldPrice = "$350"
let newPrice = "$299"

self.myLabel.setLabelText("New price \(oldPrice) \(newPrice)")
            .set(font: UIFont.systemFont(ofSize: 12))
            .set(textColor: .black)
            .set(textColor: .red, onSubstring: newPrice)
            .set(textColor: .lightGray, onSubstring: oldPrice)
            .set(attribute: NSStrikethroughStyleAttributeName, value: NSNumber(value: 1), onSubstring: oldPrice)
            .configure()
```

All these examples can be found on the repository "Examples" project.



## Author

If you want to get in touch, reach me on twitter: [@fabioacalmeida](https://twitter.com/fabioacalmeida)


## License

LabelConfigurator is available under the MIT license. See the LICENSE file for more info.
