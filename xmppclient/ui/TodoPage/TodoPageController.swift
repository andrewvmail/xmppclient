import UIKit

class TodoPageController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todos: [String] = []
    var todosObservation: NSKeyValueObservation?
    @IBOutlet var textLabel: UILabel?
    @IBOutlet var tableView: UITableView! = UITableView()

    @IBAction func addToDo(_ sender: UIButton) {
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            run(sequence: submitNewTodoSequence, name: "submitNewTodoSequence", props: textField.text!)
        }))
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

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("delete")
            run(sequence: removeTodoSequence, name: "removeTodoSequence", props: 0)

            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
}

