
## SmartAttributedString -  A convenient way to create NSAttributedStrings

## Usage


### A simple case 

A fluent interface can be used in simple cases

```swift
    let smartString = SmartAttributedString()
    smartString.add("Bold").font(UIFont.boldSystemFontOfSize(14))
    smartString.add("Normal").font(UIFont.systemFontOfSize(13))
    self.label.attributedText = smartString.attributedString
```

### More Complex

So you need an attributed string , with "Red" written in red letters and "Green" written in green letters with differing fonts and underline colors ?

Here you go !

A closure based interface can be used for more complex cases

```swift
	let smartString = SmartAttributedString()
	smartString.add("Red") {
	    $0.color(UIColor.redColor())
	    $0.font( UIFont.boldSystemFontOfSize(13))
	}

	smartString.add("Green") {
	    $0.color(UIColor.greenColor())
	    $0.font(UIFont.boldSystemFontOfSize(14))
	    $0.strikethrough(UIColor.blueColor())
	}


	self.centerLabel.attributedText = smartString.attributedString
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
