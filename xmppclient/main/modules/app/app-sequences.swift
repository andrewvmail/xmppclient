import Foundation

func bootstrapSequence() {
    if tokenExist() {
        navSequence(page: "TabbedPage")
        return;
    }
    navSequence(page: "WelcomePage")
}

func navSequence(page: String) {
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
    if(page.contains("PhonePage")) {

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