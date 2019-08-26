import UIKit

class PhoneVerificationPageController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        controller().navigation.isNavigationBarHidden = false
        controller().navigation.navigationBar.topItem?.title = "Phone Verification"
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
        run(
                sequence: registration().verifyPhone,
                name: "registration.verifyPhone"
        )
    }

    @objc func onPhoneInput(_ textField: UITextField) {
        print(textField.text)
        run(sequence: registration().onPhoneInput,
                name: "registration.onPhoneInput",
                props: textField.text!)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        PhoneVerificationView(self: self)
        counterObservation = controller().state!.counter.observe(\.count, options: [.initial]) { [weak self] (model, change) in
            self?.count.text = "\(model.count)"
        }
    }

}

