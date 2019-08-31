import Foundation
import UIKit
func bootstrapSequence() {
    if tokenExist() {
        navSequence(page: "TabbedPage")
        return;
    }
    navSequence(page: "WelcomePage")
}

func navSequence(page: String) {
    DispatchQueue.main.async {
        print("navSequence")
        if (page.contains("PhoneVerificationPage")) {
            print("navigating to PhoneVerificationPage")
            controller().navigation.pushViewController(PhoneVerificationPageController(), animated: true);
        }
        if (page.contains("WelcomePage")) {
            // controller().navigation.pushViewController(TabbedPage(), animated: true);
            controller().navigation.pushViewController(WelcomePageController(), animated: true);
        }
        if (page.contains("SmsVerificationPage")) {
            controller().navigation.pushViewController(SmsVerificationPage(), animated: true);
        }
        if (page.contains("TabbedPage")) {
            controller().navigation.setViewControllers([TabbedPage()], animated: false)
        }
        if (page.contains("PhonePage")) {

        }
        if (page.contains("InCallPage")) {
            let transition:CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromTop
            // self.navigationController!.view.layer.add(transition, forKey: kCATransition)
            controller().navigation.view.layer.add(transition, forKey: kCATransition)
            // pushViewController(InCallPage(), animated: true, transition: transition);
            // self.navigationController?.pushViewController(dstVC, animated: false)
            controller().navigation.pushViewController(InCallPage(), animated: false);
        }
    }
}

// func navSequence(page: String) {
//     print("navSequence")
//     if (page.contains("PhoneVerificationPage")) {
//         print("navigating to PhoneVerificationPage")
//         controller().navigation.pushViewController(PhoneVerificationPageController(), animated: true);
//     }
//
//     if (page.contains("WelcomePage")) {
//         controller().navigation.pushViewController(WelcomePageController(), animated: true);
//     }
//     if(page.contains("SmsVerificationPage")) {
//         controller().navigation.pushViewController(SmsVerificationPage(), animated: true);
//     }
// }