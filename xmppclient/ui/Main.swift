import UIKit

class ViewController: UIViewController {
//        UIViewController, UITableViewDataSource {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.todos.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
//        cell.textLabel?.text = todos[indexPath.row]
//        return cell
//    }
//
//    var todos: [String] = []
//    var count: Int? = 0
//    var counterObservation: NSKeyValueObservation?
//    var todosObservation: NSKeyValueObservation?
//
//    @IBAction func tapIncrement(sender: UIButton) {
//        run(sequence: increment, name: "increment")
//    }
//    @IBAction func tapDecrement(sender: UIButton) {
//        run(sequence: decrement, name: "decrement")
//    }
//    @IBAction func tapAddTodo(sender: UIButton) {
//        run(sequence: submitNewTodoSequence, name: "submitNewTodoSequence", props: todoInput.text!)
//    }
//
//    @IBOutlet var textLabel: UILabel?
//    @IBOutlet var tableView: UITableView!
//    @IBOutlet weak var todoInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
//        controller().views = self
//        counterObservation = controller().state.counter.observe(\.count, options: [.initial]) { (model, change) in
//            self.textLabel?.text = "\(model.count)"
//        }
//        todosObservation = controller().state.todos.observe(\.todos, options: [.initial]) { (model, change) in
//            self.todos = model.todos
//            self.tableView.reloadData()
//
//            // scroll to bottom
//            self.tableView.layoutIfNeeded()
//            self.tableView.setContentOffset(CGPoint(
//                    x: 0,
//                    y: self.tableView.contentSize.height - self.tableView.frame.height),
//                    animated: false)
//        }
//    }
//    func clearInput() {
//        todoInput.text = ""
//    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
