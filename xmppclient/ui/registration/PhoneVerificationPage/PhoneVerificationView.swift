import UIKit

func PhoneVerificationView(self: PhoneVerificationPageController) {

    let sampleTextField = UITextField(frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 40))
    sampleTextField.placeholder = "Enter your phone number"
    sampleTextField.font = UIFont.systemFont(ofSize: 15)
    sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
    sampleTextField.autocorrectionType = UITextAutocorrectionType.no
    sampleTextField.keyboardType = UIKeyboardType.default
    sampleTextField.returnKeyType = UIReturnKeyType.done
    sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
    sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    sampleTextField.addTarget(self, action: #selector(self.onPhoneInput(_:)),
            for: UIControl.Event.editingChanged)
    self.view.addSubview(sampleTextField)


    // Create the UIButton with frame
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 50, y: 220, width: 170, height: 30)
    button.setTitle("Verify", for: .normal)
    button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    button.center.x = self.view.center.x
    button.center.y = self.view.center.y
    self.view.addSubview(button)
}
