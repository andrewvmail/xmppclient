import Foundation

class TodoReactions {
    var todoObservation: NSKeyValueObservation?
    var runOnce = false

    init() {
        print("todoReactionsinit");

        todoObservation = state().todos.observe(\.todos, options: [.initial]) { [weak self] (model, change) in
            print("todo reactions")
            let defaults = UserDefaults.standard

            if(self?.runOnce == false) {
                print("run this once for hydration")
                if let value = defaults.array(forKey: "todos.todos") {
                    print(value)
                    state().todos.todos = value as! [String]
                }
                self?.runOnce = true
            }

            if (!model.todos.isEmpty) {
                print("* NOT EMPTY *")


                defaults.set(model.todos, forKey: "todos.todos")
                defaults.synchronize()
            }

        }

    }
}

