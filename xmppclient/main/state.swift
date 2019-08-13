import Foundation

final class State {
    var counter = CounterState()
    var todos = TodoState()

//    var description: String {
//        return "\(counter.count) \(todos.todos)"
//    }
}
extension State: Encodable {
    enum codingKeys: String, CodingKey {
        case counter
        case todos
    }
}