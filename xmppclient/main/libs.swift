import Foundation
import UIKit

func controller() -> Controller {
    return (UIApplication.shared.delegate as! AppDelegate).controller
}
func run(action: () -> (), name: String) {
    controller().socket.write(string: "--- action: " + name)
    action()
}
func run(sequence: () -> (), name: String) {
    controller().socket.write(string: " ")
    controller().socket.write(string: String(Int.random(in: 0 ..< 10)) + "# sequence: " + name)
    sequence()
}