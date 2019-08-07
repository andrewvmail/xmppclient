import Foundation

class State {
    var counter: CounterState!
    var todos: TodoState!

    init() {
        counter = CounterState()
        todos = TodoState()
    }
}
