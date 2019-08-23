import Foundation
import UIKit
import IoniconsKit

class Tab: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        controller().navigationcontroller = UINavigationController(rootViewController: self)

        let iconList = UIImage.ionicon(with: .iosList, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
        let stopWatch = UIImage.ionicon(with: .iosStopwatch, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))

        let firstViewController = TodoPageController()
        firstViewController.tabBarItem = UITabBarItem(title: "Todo", image: iconList, tag: 1)
        firstViewController.title = "Todo"

        let secondViewController = CounterPageController()
        secondViewController.tabBarItem = UITabBarItem(title: "Counter", image: stopWatch, tag: 0)
        secondViewController.title = "Counter"

        let viewControllersList = [secondViewController, firstViewController]
        self.viewControllers = viewControllersList.map { UINavigationController(rootViewController: $0) }
//        controller().window.rootViewController = controller().navigationcontroller

//        controller().window.rootViewController = WelcomePageController();

        controller().window.makeKeyAndVisible()

        self.navigationController?.view.backgroundColor = UIColor(red:247, green:247, blue:247, alpha:1)
        self.navigationController?.isNavigationBarHidden = true;
//        controller().navigationcontroller.navigationBar.topItem?.title = "MOMO"
        controller().navigationcontroller.navigationItem.largeTitleDisplayMode = .automatic

        run(sequence: bootstrapSequence, name: "bootstrapSequence")


    }







    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
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
        if let topViewController = presentedViewController{
            return topViewController.preferredStatusBarStyle
        }
        if let topViewController = viewControllers.last {
            return topViewController.preferredStatusBarStyle
        }

        return .default
    }
}