import Foundation

class AppState: NSObject {
//    @objc dynamic var token: String = "123";
    @objc dynamic var token: String = "";
    @objc dynamic var phoneNumber: String = "";
}
extension AppState: Encodable {

}