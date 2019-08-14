import Foundation

func bootstrapSequence() {
    if tokenExist() {
        controller().window.rootViewController = controller().navigationcontroller
        return;
    }
    controller().window.rootViewController = WelcomePageController();
}