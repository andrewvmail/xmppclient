import Foundation

struct Todo {
    var id: Int
    var description: String
}

class TodoState: NSObject {
    var Todos: [Todo] = []
}
