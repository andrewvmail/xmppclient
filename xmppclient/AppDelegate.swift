import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let controller = Controller()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        controller.window = UIWindow(frame: UIScreen.main.bounds)
        controller.tabbar = Tab()
        controller.navigationbar = UINavigationBar()
        return true
    }
}

