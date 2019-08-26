import Foundation
import FirebaseAuth
import FirebaseCore

class registrationActions {
    init(actionName: String) {
        controller().socket.write(string: "--- action: " + actionName)
    }

    func someAsyncFunc(cb: (String) -> ()) {
        cb("momoissleeping")
    }

    func verifySmsCodeWithApi(cb: @escaping (String, String) -> ()) {
        print(api.verifySmsCodeWithApi.description)
        http().post(
                url: api.verifySmsCodeWithApi.description,
                params: [
                    "smsCode": state().app.smsCode,
                    "verificationId": state().app.verificationID
                ]
        ) { (error, result) in
            print("completion ranned", error, result)
            if error != nil {
                cb("", "")
                return
            }
            cb(result?["token"] as! String, result?["id"] as! String)
        }
    }

    func sendNumberToFirebase(cb: @escaping (String?) -> ()) {
        FirebaseApp.configure()
        print(state().app.phoneNumber)
        print("---------------------------")
        let phoneNumber = "+12223334444";

        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                // self.showMessagePrompt(error.localizedDescription)
                print(error.localizedDescription)
                return
            }


            print("noerror")
            // verificationID needs to be sent to the backend now
            print(verificationID)

            cb(verificationID)

            // Sign in using the verificationID and the code sent to the user
            // ...
        }

    }
}