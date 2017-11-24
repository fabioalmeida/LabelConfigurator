//
//  NSAttributedStringBuilder.swift
//  LabelConfigurator
//
//  Created by Fábio Almeida on 12/11/17.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import Foundation

private struct SubstringAttribute {
    
    let substring: String
    let attribute: NSAttributedStringKey
    let value: Any
}

private struct RangeAttribute {

    let range: NSRange
    let attribute: NSAttributedStringKey
    let value: Any
}

open class NSAttributedStringBuilder: NSObject {
    
    // MARK: Properties
    fileprivate let string: String
    fileprivate var textColor: UIColor?
    fileprivate var textFont: UIFont?
    fileprivate var fontTracking: CGFloat?
    fileprivate var textAlignment: NSTextAlignment?
    fileprivate var lineSpacing: CGFloat?
    fileprivate var substringAttributes: [SubstringAttribute]?
    fileprivate var rangeAttributes: [RangeAttribute]?

    public init(withString string: String) {
        
        self.string = string
    }
    
    // MARK: Public
    
    open func attributedString() -> NSAttributedString {
        
        return self.generateAttributedString()
    }

    @discardableResult
    @objc(setTextColor:)
    open func set(textColor color: UIColor) -> NSAttributedStringBuilder {
    
        self.textColor = color
        return self
    }

    @discardableResult
    @objc(setFont:)
    open func set(font: UIFont) -> NSAttributedStringBuilder {
    
        self.textFont = font
        return self
    }

    @discardableResult
    @objc(setFontTracking:)
    open func set(fontTracking tracking: CGFloat) -> NSAttributedStringBuilder {
        
        self.fontTracking = tracking
        return self
    }

    @discardableResult
    @objc(setTextAlignment:)
    open func set(textAlignment alignment: NSTextAlignment) -> NSAttributedStringBuilder {

        self.textAlignment = alignment
        return self
    }

    @discardableResult
    @objc(setLineSpacing:)
    open func set(lineSpacing spacing: CGFloat) -> NSAttributedStringBuilder {
        
        self.lineSpacing = spacing
        return self
    }

    @discardableResult
    @objc(setFont:onSubstring:)
    open func set(font: UIFont?, onSubstring substring: String?) -> NSAttributedStringBuilder {
        
        return self.set(attribute: NSAttributedStringKey.font, value: font, onSubstring: substring)
    }

    @discardableResult
    @objc(setTextColor:onSubstring:)
    open func set(textColor color: UIColor?, onSubstring substring: String?) -> NSAttributedStringBuilder {
        
        return self.set(attribute: NSAttributedStringKey.foregroundColor, value: color, onSubstring: substring)
    }

    @discardableResult
    @objc(setAttribute:value:onSubstring:)
    open func set(attribute: NSAttributedStringKey?, value: Any?, onSubstring substring: String?) -> NSAttributedStringBuilder {

        if let attribute = attribute, let value = value, let substring = substring {

            let substringAttribute = SubstringAttribute(substring: substring, attribute: attribute, value: value)
            
            if self.substringAttributes == nil {
                
                self.substringAttributes = [SubstringAttribute]()
            }
            
            self.substringAttributes?.append(substringAttribute)
        }
        
        return self
    }

    @discardableResult
    @objc(setAttribute:value:onRange:)
    open func set(attribute: NSAttributedStringKey?, value: Any?, onRange range: NSRange) -> NSAttributedStringBuilder {

        if let attribute = attribute, let value = value {

            let rangeAttribute = RangeAttribute(range: range, attribute: attribute, value: value)

            if self.rangeAttributes == nil {

                self.rangeAttributes = [RangeAttribute]()
            }

            self.rangeAttributes?.append(rangeAttribute)
        }

        return self
    }
}


// MARK: - Private
private extension NSAttributedStringBuilder {
    
    func generateAttributedString() -> NSAttributedString {
        
        let stringText = NSString(string: self.string)
        let fullRange = NSMakeRange(0, stringText.length)
        let attributedString = NSMutableAttributedString(string: self.string)
        
        if let textColor = self.textColor {
            
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: textColor, range: fullRange)
        }
        
        if let textFont = self.textFont {
            
            attributedString.addAttribute(NSAttributedStringKey.font, value: textFont, range: fullRange)
        }
        
        if let fontTracking = self.fontTracking {
            
            attributedString.addAttribute(NSAttributedStringKey.kern, value: fontTracking, range: fullRange)
        }

        var paragraphStyle: NSMutableParagraphStyle?

        if let lineSpacing = self.lineSpacing {

            paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle?.lineSpacing = lineSpacing
        }

        if let textAlignment = self.textAlignment {

            if (paragraphStyle == nil) {

                paragraphStyle = NSMutableParagraphStyle()
            }

            paragraphStyle?.alignment = textAlignment
        }

        if let paragraphStyle = paragraphStyle {

            attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: fullRange)
        }
        
        if let substringAttributes = self.substringAttributes {
            
            substringAttributes.forEach({ (attribute: SubstringAttribute) in
                
                let range = stringText.range(of: attribute.substring)
                attributedString.addAttribute(attribute.attribute, value: attribute.value, range: range)
            })
        }

        if let rangeAttributes = self.rangeAttributes {

            rangeAttributes.forEach({ (attribute: RangeAttribute) in

                attributedString.addAttribute(attribute.attribute, value: attribute.value, range: attribute.range)
            })
        }
        
        return attributedString
    }
}
