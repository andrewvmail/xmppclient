import Foundation
import UIKit

func changeNewTodoTitleSequence() {
//= set(state.newTodoTitle, props.title)
}

func removeTodoSequence() {
//    = unset(state.todos[props.uid])
}

func toggleAllCheckedSequence() {
//    actions.toggleAllChecked
}

func toggleTodoCompletedSequence() {
//    = toggle(state.todos[props.uid].completed)
}

func clearCompletedTodosSequence() {
//    d= actions.clearCompletedTodos
}

func changeFilterSequence() {
    // = set(state.filter, props.filter)
}

func submitNewTodoSequence(props: String?) {
    run(action: addTodo, name: "addTodo", props: props!)
}

//    when(state.newTodoTitle),
//    {
//        true: [actions.addTodo, set(state.newTodoTitle, '')],
//        false: [],
//    },
//]
//
func changeTodoTitleSequence() {
    // = set(
}

//        state.todos[props.uid].editedTitle,
//        props.title
//)
//
func editTodoSequence() {
    // = [
}

//    set(state.todos[props.uid].editedTitle, state.todos[props.uid].title),
//    set(state.editingUid, props.uid),
//]
//
func abortEditSequence() {
    // = [
}

//    unset(state.todos[props.uid].editedTitle),
//    set(state.editingUid, null),
//]
//
func submitTodoTitleSequence() {
    // = [
}

//    when(state.todos[props.uid].editedTitle),
//    {
//        true: [
//        set(state.todos[props.uid].title, state.todos[props.uid].editedTitle),
//        unset(state.todos[props.uid].editedTitle),
//        set(state.editingUid, null),
//    ],
//        false: [],
//    },
//]