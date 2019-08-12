import Foundation
import UIKit

func toggleAllChecked() {
//    const isCompleted = !get(state.isAllChecked)
//    const uids = get(state.uids)
//
//    uids.forEach((uid) => {
//        store.set(state.todos[uid].completed, isCompleted)
//    })
}

func addTodo(props: String) {
    controller().state.todos.todos.append(props)
}

//    store.set(state.todos[id.create()], {
//        title: get(state.newTodoTitle),
//        completed: false,
//    })


func clearCompletedTodos() {
//    const todos = get(state.todos)
//
//    Object.keys(todos).forEach((uid) => {
//        if (todos[uid].completed) {
//            store.unset(state.todos[uid])
//        }
//    })
}

func deleteTodo(props: Int) {
    controller().state.todos.todos.remove(at: props)
}