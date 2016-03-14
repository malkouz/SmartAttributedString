//
//  ViewController.swift
//  SwiftAttributedString
//
//  Created by Samhan on 10/03/16.
//  Copyright © 2016 Samhan. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

