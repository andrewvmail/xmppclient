import UIKit

class CounterPageController: UIViewController {
    var counterObservation: NSKeyValueObservation?

    @IBOutlet var count: UILabel! = UILabel()

    @IBAction func tapIncrement(_ sender: UIButton) {
        run(sequence: increment, name: "increment")
    }

    @IBAction func tapDecrement(_ sender: UIButton) {
        run(sequence: decrement, name: "decrement")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CounterPageView(self: self)
        counterObservation = controller().state!.counter.observe(\.count, options: [.initial]) { [weak self] (model, change) in
            self?.count.text = "\(model.count)"
        }
    }
}

