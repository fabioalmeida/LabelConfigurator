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

    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {

        super.viewDidLoad()

        self.myLabel.setLabelText("Sed ut perspiciatis unde omnis iste natus error")
                    .set(font: UIFont.boldSystemFont(ofSize: 30))
                    .set(textColor: .blue)
                    .set(lineSpacing: 6)
                    .configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

