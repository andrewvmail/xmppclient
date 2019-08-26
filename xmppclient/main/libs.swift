import UIKit

func controller() -> Controller {
    return (UIApplication.shared.delegate as! AppDelegate).controller
}
func state() -> State {
    return (UIApplication.shared.delegate as! AppDelegate).controller.state
}
func http() -> Http {
    return (UIApplication.shared.delegate as! AppDelegate).controller.http
}


func run(action: () -> (String), name: String) {
    controller().socket.write(string: "--- action: " + name)
    // controller().socket.write(string: "--- action: " + controller().state.description)
    action()
}
func run(action: () -> (), name: String) {
    controller().socket.write(string: "--- action: " + name)
    // controller().socket.write(string: "--- action: " + controller().state.description)
    action()
}



func run(action: (String) -> (String), name: String, props: String) {
    controller().socket.write(string: "--- action: " + name)
    // controller().socket.write(string: "--- action: " + controller().state.description)
    action(props)
}
func run(action: (String) -> (String?), name: String, props: String) {
    controller().socket.write(string: "--- action: " + name)
    let jsonData = try! JSONEncoder().encode(controller().state)
    let jsonString = String(data: jsonData, encoding: .utf8)!
    controller().socket.write(string: jsonString)
    // controller().socket.write(string: "--- action: " + controller().state)
    action(props)
}


func run(sequence: () -> (), name: String) {
    let message: String = String(Int.random(in: 0..<10)) + "# sequence: " + name
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
    sequence()
    sendStateToDebugger()
}


func run(sequence: (String) -> (), name: String, props: String = "") {
    sendSequenceToDebugger(name: name)
    sequence(props)
    sendStateToDebugger()
}

func run(sequence: (Int) -> (), name: String, props: Int?) {
    sendSequenceToDebugger(name: name)
    sequence(props!)
    sendStateToDebugger()
}


func sendSequenceToDebugger(name: String) {
    let message: String = String(Int.random(in: 0..<10)) + "# sequence: " + name + " -> props: " 
    controller().socket.write(string: " ")
    controller().socket.write(string: message)
}

func sendStateToDebugger() {
    let jsonData = try! JSONEncoder().encode(controller().state)
    let jsonString = String(data: jsonData, encoding: .utf8)!
    controller().socket.write(string: jsonString)
}