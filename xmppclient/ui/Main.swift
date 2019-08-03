import UIKit

class ViewController: UIViewController {
    @IBOutlet var textLabel: UILabel?

    var count: Int? = 0
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()

        observation = controller().state.observe(\.count, options: [.initial]) { (model, change) in
            self.textLabel?.text = "\(model.count)"
        }
    }

    @IBAction func tapIncrement(sender: UIButton) {
        run(sequence: increment, name: "increment")
    }
    @IBAction func tapDecrement(sender: UIButton) {
        run(sequence: decrement, name: "decrement")
    }
}
