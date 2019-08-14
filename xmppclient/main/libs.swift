import UIKit

func controller() -> Controller {
    return (UIApplication.shared.delegate as! AppDelegate).controller
}


func run(action: () -> (), name: String) {
    controller().socket.write(string: "--- action: " + name)
//    controller().socket.write(string: "--- action: " + controller().state.description)
    action()
}

func run(action: (String) -> (), name: String, props: String) {
    controller().socket.write(string: "--- action: " + name)
    let jsonData = try! JSONEncoder().encode(controller().state)
    let jsonString = String(data: jsonData, encoding: .utf8)!
    controller().socket.write(string: jsonString)


//    controller().socket.write(string: "--- action: " + controller().state)
    action(props)
}


func run(sequence: () -> (), name: String) {
    let message: String = String(Int.random(in: 0..<10)) + "# sequence: " + name
//    controller().socket.write(string: " ")
//    controller().socket.write(string: message)
    sequence()
}

func run(sequence: (String) -> (), name: String, props: String = "") {
    let message: String = String(Int.random(in: 0..<10)) + "# sequence: " + name + " -> props: " + props
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
    sequence(props)
}

func run(sequence: (Int) -> (), name: String, props: Int?) {
    let message: String = String(Int.random(in: 0..<10)) + "# sequence: " + name + " -> props: " + String(props!)
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
    sequence(props!)
}
