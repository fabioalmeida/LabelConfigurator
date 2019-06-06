//
//  UILabelBuilder.swift
//  LabelConfigurator
//
//  Created by Fábio Almeida on 12/11/17.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import Foundation

open class UILabelBuilder: NSObject {
    
    // MARK: Properties
    fileprivate let label: UILabel
    fileprivate let text: String
    fileprivate var textColor: UIColor?
    fileprivate var backgroundColor: UIColor?
    fileprivate var font: UIFont?
    fileprivate var minimumFontSize: CGFloat?
    fileprivate var textAlignment: NSTextAlignment?
    fileprivate var shouldSetAttributedText: Bool
    fileprivate lazy var attributedStringBuilder: NSAttributedStringBuilder = {
        
        return NSAttributedStringBuilder(withString: self.text)
    }()
    
    init(withLabel label: UILabel, text: String) {
        
        self.label = label
        self.text = text
        self.shouldSetAttributedText = false
        super.init()
    }
    
    // MARK: Public
    
    open func configure() {
        
        self.configureLabel()
    }

    @discardableResult
    @objc(setTextColor:)
    open func set(textColor color: UIColor) -> UILabelBuilder {
        
        self.textColor = color
        return self
    }

    @discardableResult
    @objc(setBackgroundColor:)
    open func set(backgroundColor color: UIColor) -> UILabelBuilder {
        
        self.backgroundColor = color
        return self
    }

    @discardableResult
    @objc(setFont:)
    open func set(font: UIFont) -> UILabelBuilder {
        
        self.font = font
        return self
    }

    @discardableResult
    @objc(setAlignment:)
    open func set(alignment: NSTextAlignment) -> UILabelBuilder {
        
        self.textAlignment = alignment
        return self
    }

    @discardableResult
    @objc(setMinimumFontSize:)
    open func set(minimumFontSize size: CGFloat) -> UILabelBuilder {
        
        self.minimumFontSize = size
        return self
    }

    @discardableResult
    @objc(setFontTracking:)
    open func set(fontTracking tracking: CGFloat) -> UILabelBuilder {
        
        self.attributedStringBuilder.set(fontTracking: tracking)
        self.shouldSetAttributedText = true
        return self
    }

    @discardableResult
    @objc(setLineSpacing:)
    open func set(lineSpacing spacing: CGFloat) -> UILabelBuilder {
        
        self.attributedStringBuilder.set(lineSpacing: spacing)
        self.shouldSetAttributedText = true
        return self
    }

    @discardableResult
    @objc(setFont:onSubstring:)
    open func set(font: UIFont, onSubstring substring: String) -> UILabelBuilder {
        
        self.attributedStringBuilder.set(font: font, onSubstring: substring)
        self.shouldSetAttributedText = true
        return self
    }

    @discardableResult
    @objc(setTextColor:onSubstring:)
    open func set(textColor color: UIColor, onSubstring substring: String) -> UILabelBuilder {
        
        self.attributedStringBuilder.set(textColor: color, onSubstring: substring)
        self.shouldSetAttributedText = true
        return self
    }

    @discardableResult
    @objc(setAttribute:value:onSubstring:)
    open func set(attribute: NSAttributedString.Key, value: Any, onSubstring substring: String) -> UILabelBuilder {
     
        self.attributedStringBuilder.set(attribute: attribute, value: value, onSubstring: substring)
        self.shouldSetAttributedText = true
        return self
    }

    @discardableResult
    @objc(setAttribute:value:onRange:)
    open func set(attribute: NSAttributedString.Key, value: Any, onRange range: NSRange) -> UILabelBuilder {

        self.attributedStringBuilder.set(attribute: attribute, value: value, onRange: range)
        self.shouldSetAttributedText = true
        return self
    }
}


// MARK: - Private
private extension UILabelBuilder {
    
    func configureLabel() {
        
        if let textAlignment = self.textAlignment {

            if self.shouldSetAttributedText {

                self.attributedStringBuilder.set(textAlignment: textAlignment)

            } else {

                self.label.textAlignment = textAlignment
            }
        }
        
        if !self.shouldSetAttributedText {
            
            self.label.text = self.text
        }
        
        if let textColor = self.textColor {
            
            self.label.textColor = textColor
        }
        
        if let backgroundColor = self.backgroundColor {
            
            self.label.backgroundColor = backgroundColor
        }
        
        if let font = self.font {
            
            self.label.font = font

            if let minimumFontSize = self.minimumFontSize {
                
                self.label.adjustsFontSizeToFitWidth = true
                self.label.minimumScaleFactor = minimumFontSize/font.pointSize
            }
        }
        
        if self.shouldSetAttributedText {
            
            let attributedString = self.attributedStringBuilder.attributedString()
            self.label.attributedText = attributedString
        }
    }
}
