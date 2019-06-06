//
//  ViewController.swift
//  LabelConfigurator
//
//  Created by fabioalmeida on 11/12/2017.
//  Copyright (c) 2017 fabioalmeida. All rights reserved.
//

import UIKit
import LabelConfigurator

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {

        super.viewDidLoad()

        let label1 = UILabel()

        label1.setLabelText("Some text")
              .set(font: UIFont.boldSystemFont(ofSize: 14))
              .set(textColor: .blue)
              .configure()

        self.stackView.addArrangedSubview(label1)



        let label2 = UILabel()
        label2.numberOfLines = 0

        label2.setLabelText("Some text \n Other text")
              .set(font: UIFont.boldSystemFont(ofSize: 14))
              .set(textColor: .blue)
              .set(fontTracking: 4)
              .set(lineSpacing: 10)
              .configure()

        self.stackView.addArrangedSubview(label2)



        let label3 = UILabel()

        let minimumAmount = "$5"

        label3.setLabelText("Please donate \(minimumAmount) or more!")
            .set(font: UIFont.systemFont(ofSize: 12))
            .set(textColor: .black)
            .set(font: UIFont.boldSystemFont(ofSize: 13), onSubstring: minimumAmount)
            .set(textColor: .red, onSubstring: minimumAmount)
            .configure()

        self.stackView.addArrangedSubview(label3)



        let label4 = UILabel()

        let oldPrice = "$350"
        let newPrice = "$299"

        label4.setLabelText("New price \(oldPrice) \(newPrice)")
            .set(font: UIFont.systemFont(ofSize: 12))
            .set(textColor: .black)
            .set(textColor: .red, onSubstring: newPrice)
            .set(textColor: .lightGray, onSubstring: oldPrice)
            .set(attribute: NSAttributedString.Key.strikethroughStyle, value: 1, onSubstring: oldPrice)
            .configure()

        self.stackView.addArrangedSubview(label4)
    }
}
