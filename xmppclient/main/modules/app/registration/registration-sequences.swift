import Foundation

struct registration {
    func phoneVerificationOnInput() {

    }

    func onInputSmsCode(props: String) {
        controller().state.app.smsCode = props;
    }

    func onPhoneInput(props: String) {
        controller().state.app.phoneNumber = props;
    }

    func verifySmsCode() {
        // var context: Dictionary = [String: Any]()
        registrationActions.init(actionName: "verifySmsCodeWithApi").verifySmsCodeWithApi { token, id in
            if (token.isEmpty || id.isEmpty) {
                // context["token"] = ""
                // state().app.token = "YEAH!!!!!"
                // navSequence(page: "WelcomePage")
                showToast(message: "There is an error please try again")
            } else {
                // context["token"] = token
                state().app.token = token
                state().profile.id = id
                navSequence(page: "TabbedPage")
            }
        }
    }

    func verifyPhone() {


        registrationActions.init( actionName: "sendNumberToFirebase").sendNumberToFirebase { verificationID in
            print("verifyPhone cb", verificationID)


            if (verificationID != nil) {
                state().app.verificationID = verificationID
                navSequence(page: "SmsVerificationPage")
            }
            else {

            }



        }
    }

    func sample() {
        var context: Dictionary = [String: Any]()
        let group = DispatchGroup()
        group.enter()
        registrationActions.init(actionName: "verifySmsCodeWithApi").verifySmsCodeWithApi { token, id in
            if (token.isEmpty) {
                context["token"] = ""
                state().app.token = "YEAH!!!!!"
            } else {
                context["token"] = token
                state().app.token = token
            }
            group.leave()
        }

        group.notify(queue: .main) {
            print("context", context)
        }
    }

    func checkIfUserIdExist() {

    }


    func onChangeRegisterUserId() {
    }

    func registerUserId() {
    }
}