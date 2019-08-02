import UIKit

class ViewController: UIViewController {
    @IBOutlet var textLabel: UILabel?

    var count: Int? = 0
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.observation = (UIApplication.shared.delegate as! AppDelegate)
                .controller.State.observe(\state.count, options: [.initial]) { (model, change) in
            print("moodel", model.count)
            self.textLabel?.text = "\(model.count)"
        }
    }

    @IBAction func tapPetMomo(sender: UIButton) {
        sequences.init().feedMomoSequence()
    }
}
