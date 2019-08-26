import Foundation

class ProfileState: NSObject {
    @objc dynamic var id: String = "";
}

extension ProfileState: Encodable {
}
