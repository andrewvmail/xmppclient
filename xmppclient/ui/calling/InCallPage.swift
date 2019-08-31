import UIKit

class InCallPage: UIViewController, UITableViewDataSource, UITableViewDelegate {

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

    @objc func onPhoneInput(_ textField: UITextField) {
        // print(textField.text)
        // run(sequence: registration().onInputSmsCode,
        //         name: "registration.onInputSmsCode",
        //         props: textField.text!)
        // print("----")
    }

    @objc func buttonTapped() {
        // print(textField.text)
        // run(sequence: registration().onInputSmsCode,
        //         name: "registration.onInputSmsCode",
        //         props: textField.text!)
        // print("----")
    }

    @IBOutlet var phoneNumberInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.isOpaque = false
        view.backgroundColor = .white

        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)

        phoneNumberInput = UITextField(frame: CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40, height: 40))
        phoneNumberInput.placeholder = "Enter your phone number"
        phoneNumberInput.font = UIFont.systemFont(ofSize: 15)
        phoneNumberInput.borderStyle = UITextField.BorderStyle.roundedRect
        phoneNumberInput.autocorrectionType = UITextAutocorrectionType.no
        phoneNumberInput.keyboardType = UIKeyboardType.default
        phoneNumberInput.returnKeyType = UIReturnKeyType.done
        phoneNumberInput.clearButtonMode = UITextField.ViewMode.whileEditing
        phoneNumberInput.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        phoneNumberInput.addTarget(self, action: #selector(self.onPhoneInput(_:)),
                for: UIControl.Event.editingChanged)
        self.view.addSubview(phoneNumberInput)


        phoneNumberInput.keyboardType = UIKeyboardType.numberPad


        // Create the UIButton with frame
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 50, y: 220, width: 170, height: 30)
        button.setTitle("Call", for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y
        self.view.addSubview(button)


        // let newBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.addToDo))
        // self.navigationItem.rightBarButtonItem = newBtn

        // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // self.tableView.frame = self.view.bounds
        // self.tableView.center.x = self.view.center.x
        // self.tableView.center.y = self.view.center.y
        // self.tableView.dataSource = self
        // self.tableView.delegate = self as! UITableViewDelegate
        // self.view.addSubview(self.tableView)
        //
        // todosObservation = controller().state.todos.observe(\.todos, options: [.initial]) { (model, change) in
        //     self.todos = model.todos
        //     self.tableView.reloadData()
        // }
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
            run(sequence: removeTodoSequence, name: "removeTodoSequence", props: indexPath.row)
        }
    }
}

