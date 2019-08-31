import Foundation
import UIKit
import IoniconsKit

class TabbedPage: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
        self.tabBar.isHidden = false
        self.view.backgroundColor = .white
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let iconList = UIImage.ionicon(with: .iosList, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
        let stopWatch = UIImage.ionicon(with: .iosStopwatch, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
        let phoneIcon = UIImage.ionicon(with: .iosTelephone, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))

        let firstViewController = PhonePage()
        firstViewController.tabBarItem = UITabBarItem(title: "Phone", image: phoneIcon, tag: 0)
        firstViewController.title = "Phone"

        let secondViewController = CounterPageController()
        secondViewController.tabBarItem = UITabBarItem(title: "Counter", image: stopWatch, tag: 1)
        secondViewController.title = "Counter"

        let thirdViewController = TodoPageController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Todo", image: iconList, tag: 2)
        thirdViewController.title = "Todo"

        let viewControllersList = [firstViewController, secondViewController, thirdViewController]
        self.viewControllers = viewControllersList.map {
            UINavigationController(rootViewController: $0)
        }

        controller().window.rootViewController = controller().navigationcontroller
        controller().window.rootViewController?.tabBarController?.view.backgroundColor = .white
        controller().window.makeKeyAndVisible()
        controller().navigationcontroller.view.backgroundColor = .white

        // self.navigationController?.view.backgroundColor = UIColor(red: 247, green: 247, blue: 247, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true;
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }


    // override func viewWillAppear(_ animated: Bool) {

    // }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topViewController = presentedViewController {
            return topViewController.preferredStatusBarStyle
        }
        if let topViewController = viewControllers.last {
            return topViewController.preferredStatusBarStyle
        }

        return .default
    }
}