import UIKit

func PhoneVerificationView(self: PhoneVerificationPageController) {

    let sampleTextField = UITextField(frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 40))
    sampleTextField.placeholder = "Enter text here"
    sampleTextField.font = UIFont.systemFont(ofSize: 15)
    sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
    sampleTextField.autocorrectionType = UITextAutocorrectionType.no
    sampleTextField.keyboardType = UIKeyboardType.default
    sampleTextField.returnKeyType = UIReturnKeyType.done
    sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
    sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//    sampleTextField.delegate = self
    self.view.addSubview(sampleTextField)
}
