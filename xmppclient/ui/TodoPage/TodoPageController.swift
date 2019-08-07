import UIKit

class TodoPageController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todos: [String] = []
    var todosObservation: NSKeyValueObservation?
    @IBOutlet var textLabel: UILabel?
    @IBOutlet var tableView: UITableView! = UITableView()
    @IBOutlet weak var todoInput: UITextField!

    @IBAction func tapAddTodo(sender: UIButton) {
        run(sequence: submitNewTodoSequence, name: "submitNewTodoSequence", props: todoInput.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TodoPageView(self: self)
        todosObservation = controller().state.todos.observe(\.todos, options: [.initial]) { (model, change) in
            self.todos = model.todos
            self.tableView.reloadData()

            // scroll to bottom
            self.tableView.layoutIfNeeded()
            self.tableView.setContentOffset(CGPoint(
                    x: 0,
                    y: self.tableView.contentSize.height - self.tableView.frame.height),
                    animated: false)
        }
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

