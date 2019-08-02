import UIKit

class ViewHelperController: UIViewController {
    func State() -> state {
        return (UIApplication.shared.delegate as! AppDelegate).controller.State
    }
}