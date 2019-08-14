import Foundation

//struct Todo {
//    var id: Int
//    var description: String
//}

class TodoState: NSObject {
    @objc dynamic var todos: [String] = []
}
extension TodoState: Encodable {
    
}
