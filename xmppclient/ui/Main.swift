import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var hobbies: [String] = ["Computers", "Photography", "Cars", "Reading", "Learning New Things"]


    @IBOutlet var textLabel: UILabel?

    var count: Int? = 0
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        observation = controller().state.counter.observe(\.count, options: [.initial]) { (model, change) in
            self.textLabel?.text = "\(model.count)"
        }
    }

    @IBAction func tapIncrement(sender: UIButton) {
        run(sequence: increment, name: "increment")
    }

    @IBAction func tapDecrement(sender: UIButton) {
        run(sequence: decrement, name: "decrement")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = hobbies[indexPath.row]
        return cell
    }
}
