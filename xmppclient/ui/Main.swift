import UIKit

class ViewController: ViewHelperController {
    @IBOutlet var textLabel: UILabel?

    var count: Int? = 0
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()

        observation = State().observe(\state.count, options: [.initial])
        { (model, change) in
            self.textLabel?.text = "\(model.count)"
        }
    }

    @IBAction func tapPetMomo(sender: UIButton) {
        sequences.init().feedMomoSequence()
    }
}
