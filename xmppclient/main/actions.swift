import Foundation
import UIKit

struct actions {
    func add() {
        print("add")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.controller.State.count = (appDelegate.controller.State.count) + 1;
        appDelegate.controller.socket.write(string: "Hi Server!")
        print("count", appDelegate.controller.State.count as Any);
    }
}
