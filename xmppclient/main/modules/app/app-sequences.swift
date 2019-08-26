import Foundation

func bootstrapSequence() {
    controller().window.rootViewController = controller().navigationcontroller

    if tokenExist() {
        // controller().window.rootViewController = controller().navigationcontroller
        return;
    }
    // controller().navigation.pushViewController(WelcomePageController(), animated: true);
    controller().navigation.pushViewController(WelcomePageController(), animated: false);
    // controller().navigation.pushViewController(TabbedPage(), animated: true);

    // controller().window.rootViewController = SmsVerificationPage()


    // controller().navigation.pushViewController(SmsVerificationPage(), animated: true);
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


        // controller().navigation.popToRootViewController(animated: false)
        controller().navigation.setViewControllers([TabbedPage()], animated: false)
        // controller().navigation.pushViewController(TabbedPage(), animated: false);
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