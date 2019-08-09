import Foundation
import UIKit
import IoniconsKit

class Tab: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let iconList = UIImage.ionicon(with: .iosList, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
        let stopWatch = UIImage.ionicon(with: .iosStopwatch, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))

        let firstViewController = TodoPageController()
        firstViewController.tabBarItem = UITabBarItem(title: "Todo", image: iconList, tag: 1)
        firstViewController.view.backgroundColor = UIColor.orange
        firstViewController.title = "Todo"

        let secondViewController = CounterPageController()
        secondViewController.tabBarItem = UITabBarItem(title: "Counter", image: stopWatch, tag: 0)
        secondViewController.view.backgroundColor = UIColor.orange
        secondViewController.title = "Counter"

        let tabBarList = [secondViewController, firstViewController]

        controller().window.rootViewController = UINavigationController(rootViewController: self)
        controller().window.makeKeyAndVisible()

        self.viewControllers = tabBarList
        self.navigationController?.isNavigationBarHidden = true;
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}