import Foundation

class TodoState: NSObject {
    @objc dynamic var todos: [String] = []
}
extension TodoState: Encodable {
    
}
