import UIKit
import Foundation
import FirebaseAuth
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let controller = Controller()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        controller.window = UIWindow(frame: UIScreen.main.bounds)
        controller.navigationbar = UINavigationBar()
        controller.afterInit()


        return true
    }
}

extension UIColor {
    static var systemBlue: UIColor {
        return UIButton(type: .system).tintColor
    }
}

// https://stackoverflow.com/questions/24056205/how-to-use-background-thread-in-swift
extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}

// https://stackoverflow.com/questions/26667009/get-top-most-uiviewcontroller
extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}

func showToast(message: String) {

    if let topVC = UIApplication.getTopViewController() {
        // topVC.view.addSubview(forgotPwdView)

        let toastLabel = UILabel(
                frame: CGRect(
                        x: topVC.view.frame.size.width / 2 - 75,
                        y: topVC.view.frame.size.height - 100,
                        width: 150, height: 35
                )
        )

        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        topVC.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
