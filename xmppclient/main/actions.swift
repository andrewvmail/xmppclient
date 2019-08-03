import Foundation
import UIKit

func addOneToCount() {
    controller().state.count = controller().state.count + 1
}

func minusOneToCount() {
    controller().state.count = controller().state.count - 1
}