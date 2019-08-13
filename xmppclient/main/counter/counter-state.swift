import Foundation

class CounterState: NSObject {
    @objc dynamic var count: Int = 0;
}
extension CounterState: Encodable {
    
}
