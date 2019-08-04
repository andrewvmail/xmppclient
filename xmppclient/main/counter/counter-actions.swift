import Foundation
import UIKit

func addOneToCount() {
    controller().state.counter.count = controller().state.counter.count + 1
}

func minusOneToCount() {
    controller().state.counter.count = controller().state.counter.count - 1
}