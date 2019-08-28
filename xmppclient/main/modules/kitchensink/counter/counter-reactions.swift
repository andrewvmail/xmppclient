import Foundation

class CounterReactions {
    var counterObservation: NSKeyValueObservation?
    var runOnce = false

    init() {
        print("counterReaction");

        counterObservation = state().counter.observe(\.count, options: [.initial]) { [weak self] (model, change) in
            print("counter reactions")
            let defaults = UserDefaults.standard

            if (self?.runOnce == false) {
                print("run this once for hydration")
                let value = defaults.integer(forKey: "counter.count")
                print("this is an interger", value)
                state().counter.count = value
                self?.runOnce = true
            } else {
                print("* NOT EMPTY *")
                defaults.set(model.count, forKey: "counter.count")
                defaults.synchronize()
            }

        }

    }
        }

