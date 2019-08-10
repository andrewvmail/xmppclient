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
    @IBAction func anotherMethod(_ sender: UIButton) {
        run(sequence: decrement, name: "decrement")
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)

//2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }

// 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField.text)")
        }))

// 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TodoPageView(self: self)


        todosObservation = controller().state.todos.observe(\.todos, options: [.initial]) { (model, change) in
            self.todos = model.todos
            self.tableView.reloadData()
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

