import Foundation

enum api: CustomStringConvertible {
    case verifySmsCodeWithApi
    var description: String {
        switch self {
        case .verifySmsCodeWithApi: return "http://localhost:3000/verifySmsCode"
        }
    }
}