//
// Created by Andrew Tan on 2019-08-03.
// Copyright (c) 2019 Momo. All rights reserved.
//

import Foundation

class State {
    var counter: CounterState!
    var todos: TodoState!

    init() {
        counter = CounterState()
        todos = TodoState()
    }
}
