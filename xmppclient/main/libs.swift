import Foundation
import UIKit

func controller() -> Controller {
    return (UIApplication.shared.delegate as! AppDelegate).controller
}


func run(action: () -> (), name: String) {
    controller().socket.write(string: "--- action: " + name)
    action()
}
func run(action: (String) -> (), name: String, props: String) {
    controller().socket.write(string: "--- action: " + name)
    action(props)
}


func run(sequence: () -> (), name: String) {
    let message: String = String(Int.random(in: 0 ..< 10)) + "# sequence: " + name
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
    sequence()
}
func run(sequence: (String) -> (), name: String, props: String = "") {
    let message: String = String(Int.random(in: 0 ..< 10)) + "# sequence: " + name + " -> props: " + props
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
    sequence(props)
}
