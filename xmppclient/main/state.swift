import Foundation

final class State {
    var app = AppState()
    var counter = CounterState()
    var todos = TodoState()
}
extension State: Encodable {
    enum codingKeys: String, CodingKey {
        case counter
        case todos
        case app
    }
}