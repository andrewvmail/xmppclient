//
// Created by Andrew Tan on 2019-08-01.
// Copyright (c) 2019 Momo. All rights reserved.
//

import Foundation
import UIKit

struct actions {
    func add() {
        print("add")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.controller?.State.count = (appDelegate.controller?.State.count)! + 1;
        print("count", appDelegate.controller?.State.count as Any);
    }
}
