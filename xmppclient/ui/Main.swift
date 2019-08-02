//
//  Main.swift
//  xmppclient
//
//  Created by Andrew Tan on 2019-08-01.
//  Copyright © 2019 Andrew Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel:UILabel?

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    }

    @IBAction func tapPetMomo(sender: UIButton)
    {
        textLabel?.text = "Hello world!"
        print("Hello")
        sequences.init().feedMomoSequence()
    }
}
