import Foundation

final class State {
    var app = AppState()
    var counter = CounterState()
    var todos = TodoState()
    var profile = ProfileState()
}
extension State: Encodable {
    enum codingKeys: String, CodingKey {
        case counter
        case todos
        case app
        case profile
    }
}