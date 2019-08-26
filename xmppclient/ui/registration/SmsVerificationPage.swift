import UIKit

class SmsVerificationPage: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        controller().navigation.isNavigationBarHidden = false
        controller().navigation.navigationBar.topItem?.title = "Sms Verification"
    }

    var counterObservation: NSKeyValueObservation?

    @IBOutlet var count: UILabel! = UILabel()

    @IBAction func tapIncrement(_ sender: UIButton) {
        run(sequence: increment, name: "increment")
    }

    @IBAction func tapDecrement(_ sender: UIButton) {
        run(sequence: decrement, name: "decrement")
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        //Write button action here
        print("verify button pressed")
        run(sequence: registration().verifySmsCode,
                name: "registration.verifySmsCode")
    }

    @objc func onSmsInput(_ textField: UITextField) {
        print(textField.text)
        run(sequence: registration().onInputSmsCode,
                name: "registration.onInputSmsCode", 
                props: textField.text!)
        print("----")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        counterObservation = controller().state!.counter.observe(\.count, options: [.initial]) { [weak self] (model, change) in
            self?.count.text = "\(model.count)"
        }

        // sms code input
        let smsInputField = UITextField(frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 40))
        smsInputField.placeholder = "6 digit sms code"
        smsInputField.font = UIFont.systemFont(ofSize: 15)
        smsInputField.borderStyle = UITextField.BorderStyle.roundedRect
        smsInputField.autocorrectionType = UITextAutocorrectionType.no
        smsInputField.keyboardType = UIKeyboardType.default
        smsInputField.returnKeyType = UIReturnKeyType.done
        smsInputField.clearButtonMode = UITextField.ViewMode.whileEditing
        smsInputField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        // smsInputField.addTarget(self, action: #selector(self.onSmsInput(_:)), for: UIControl.Event.editingChanged)
        smsInputField.addTarget(self, action: #selector(self.onSmsInput(_:)),
                for: UIControl.Event.editingChanged)
        self.view.addSubview(smsInputField)

        // Create the UIButton with frame
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 220, width: 170, height: 30)
        button.setTitle("Verify", for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y
        self.view.addSubview(button)
    }

}

