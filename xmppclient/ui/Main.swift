import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var textLabel: UILabel?

    var count: Int? = 0
    var counterObservation: NSKeyValueObservation?
    var todosObservation: NSKeyValueObservation?
    var todos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        counterObservation = controller().state.counter.observe(\.count, options: [.initial]) { (model, change) in
            self.textLabel?.text = "\(model.count)"
        }
        todosObservation = controller().state.todos.observe(\.todos, options: [.initial]) { (model, change) in
            self.todos = model.todos
        }
    }

    @IBAction func tapIncrement(sender: UIButton) {
        run(sequence: increment, name: "increment")
    }

    @IBAction func tapDecrement(sender: UIButton) {
        run(sequence: decrement, name: "decrement")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}
