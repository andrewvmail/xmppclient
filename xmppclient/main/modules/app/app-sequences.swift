import Foundation

func bootstrapSequence() {
    controller().window.rootViewController = controller().navigationcontroller
    if tokenExist() {
//        controller().window.rootViewController = controller().navigationcontroller
        return;
    }
    controller().navigation.pushViewController(WelcomePageController(), animated: true);
}

func navSequence(props: String) {
    print("navSequence")
    if(props.contains("PhoneVerificationPage")) {
        print("navigating to PhoneVerificationPage")
        controller().navigation.pushViewController(PhoneVerificationPageController(), animated: true);
    }
}
