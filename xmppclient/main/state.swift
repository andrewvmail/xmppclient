import Foundation

class State : NSObject {
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

protocol PropertyReflectable { }

extension PropertyReflectable {
    subscript(key: String) -> Any? {
        let m = Mirror(reflecting: self)
        return m.children.first { $0.label == key }?.value
    }
}
extension State : PropertyReflectable {}