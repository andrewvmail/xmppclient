import Foundation

class AppState: NSObject {
    @objc dynamic var token: String = "";
    @objc dynamic var phoneNumber: String = "";
    @objc dynamic var captchaResponse: String = "";
    @objc dynamic var smsCode: String = "";
    @objc dynamic var verificationID: String? = "";
}

extension AppState: Encodable {
}
extension AppState : PropertyReflectable {}
