//
//  SmartAttributedString.swift
//  SwiftAttributedString
//
//  Created by Samhan on 14/03/16.
//  Copyright © 2016 Samhan. All rights reserved.
//

import UIKit


extension NSMutableParagraphStyle
{
    func addLineSpacing(spacing : CGFloat)->NSMutableParagraphStyle
    {
        self.lineSpacing = spacing
        return self
    }
    
    func addLineHeightMultiple(multiple : CGFloat)->NSMutableParagraphStyle
    {
        self.lineHeightMultiple = multiple
        return self
    }
    
    func addMinimumLineHeight(minLineHeight : CGFloat)->NSMutableParagraphStyle
    {
        self.minimumLineHeight = minLineHeight
        return self
    }
    
    func addMaximumLineHeight(max : CGFloat)->NSMutableParagraphStyle
    {
        self.maximumLineHeight = max
        return self
    }
    
    func addParagraphSpacing(spacing : CGFloat)->NSMutableParagraphStyle
    {
        self.paragraphSpacing = spacing
        return self
    }
    
    func addAlignment(alignment : NSTextAlignment)->NSMutableParagraphStyle
    {
        self.alignment = alignment
        return self
    }
    
    func addHeadIndent(indent : CGFloat)->NSMutableParagraphStyle
    {
        self.headIndent = indent
        return self
    }
    
    func addTailIndent(indent : CGFloat)->NSMutableParagraphStyle
    {
        self.tailIndent = indent
        return self
    }
    
    func addFirstLineHeadIndent(indent : CGFloat)->NSMutableParagraphStyle
    {
        self.firstLineHeadIndent = indent
        return self
    }
    
    
    func addParagraphSpacingBefore(before : CGFloat)->NSMutableParagraphStyle
    {
        self.paragraphSpacingBefore = before
        return self
    }
    
    
}

class SmartAttributedString
{
    private var lastRange : NSRange?
    private var mutableAttributedString : NSMutableAttributedString
    
    
    var attributedString : NSAttributedString {
        
        return mutableAttributedString
    }
    
    init()
    {
        mutableAttributedString = NSMutableAttributedString()
    }
    
    
    func appendAttributedString(attrString: NSAttributedString)
    {
        lastRange = NSMakeRange(mutableAttributedString.string.characters.count
            , attrString.string.characters.count)
        mutableAttributedString.appendAttributedString(attrString);
    }
    
    func add(let string : NSString , let closure : ((SmartAttributedString)->())? = nil)->SmartAttributedString
    {
        self.appendAttributedString(NSAttributedString(string: string as String))
        
        if let theClosure = closure {
            
            theClosure(self)
        }
        
        return self
    }
    
    func color(let color : UIColor,range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: theRange)
        }
        return self
    }
    
    func strikethrough(color : UIColor? = nil, range:NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSStrikethroughStyleAttributeName, value: NSNumber(bool: true), range: theRange)
            
            if let theColor = color {
                mutableAttributedString.addAttribute(NSStrikethroughColorAttributeName, value: theColor, range: theRange)
            }
        }
        return self
    }
    
    
    func kerning(kerning : Double , range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSKernAttributeName, value: NSNumber(double: kerning), range: theRange)
        }
        return self
        
    }
    
    func superscriptStyle(range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(kCTSuperscriptAttributeName as String, value: NSNumber(int: 1), range: theRange)
        }
        return self
        
    }
    
    func subscriptStyle(range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(kCTSuperscriptAttributeName as String, value: NSNumber(int: -1), range: theRange)
        }
        return self
        
    }
    
    func baselineOffset(offset : Double , range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSBaselineOffsetAttributeName, value: NSNumber(double: offset), range: theRange)
        }
        return self
        
    }
    
    func paragraphStyle(paragraphStyle : NSParagraphStyle, range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: theRange)
        }
        return self
    }
    
    func backgroundColor(let color : UIColor, range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSBackgroundColorAttributeName, value: color, range: theRange)
        }
        return self
    }
    
    func underline(color : UIColor? = nil,range : NSRange? = nil)->SmartAttributedString
    {
        if let theRange = self.getValidRange(range) {
            
            mutableAttributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(bool: true), range: theRange)
            
            if let theColor = color {
                mutableAttributedString.addAttribute(NSUnderlineColorAttributeName, value: theColor, range: theRange)
            }
            
        }
        
        return self
        
    }
    
    func getValidRange(range : NSRange?)->NSRange?
    {
        if let theRange = range {
            return theRange
        }
        else if let theLastRange = lastRange
        {
            return theLastRange
        }
        
        return nil
    }
    
    func font(let font : UIFont,range : NSRange? = nil)->SmartAttributedString
    {
        if let aRange = self.getValidRange(range) {
            mutableAttributedString.addAttribute(NSFontAttributeName, value: font, range: aRange)
        }
        
        return self
    }
    
    
}
