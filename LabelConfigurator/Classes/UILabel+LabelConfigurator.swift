//
//  UILabel+LabelConfigurator.swift
//  LabelConfigurator
//
//  Created by Fábio Almeida on 12/11/17.
//  Copyright (c) 2017 Fábio Almeida. All rights reserved.
//

import Foundation

public extension UILabel {

    public func setLabelText(_ text: String?) -> UILabelBuilder {
     
        return UILabelBuilder(withLabel: self, text: text ?? "")
    }
}
