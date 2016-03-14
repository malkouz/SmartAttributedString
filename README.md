
## SmartAttributedString -  A convenient way to create NSAttributedStrings

## Usage


A simple case 

```swift
    let smartString = SmartAttributedString()
    smartString.add("Bold").font(UIFont.boldSystemFontOfSize(14))
    smartString.add("Normal").font(UIFont.systemFontOfSize(13))
    self.label.attributedText = smartString.attributedString
```


So you need an attributed string , with "Red" written in red letters and "Green" written in green letters with differing fonts and underline colors ?

Here you go !

```swift
    let smartString = SmartAttributedString()
    smartString.add("Red").color(UIColor.redColor()).underline(UIColor.redColor())
    smartString.add("Green").color(UIColor.greenColor()).font(UIFont.boldSystemFontOfSize(14)).strikethrough(UIColor.blueColor())
    self.label.attributedText = smartString.attributedString
```

![Example](/example.png)

This is more convenient when you're creating the string instead of formatting an existing string.

## TODO :
- [ ] Better API for controlling line spacing and other paragraph attributes.
- [ ] Add a project and test target.
- [ ] Embed in a framework.
- [ ] More representative example application.
- [ ] OS X support.
- [ ] Carthage support.
- [ ] CocoaPod support.  
