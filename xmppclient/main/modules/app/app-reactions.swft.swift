import Foundation

class AppReactions {
    var tokenObservation: NSKeyValueObservation?


    init() {
        print("init");
        tokenObservation = state().app.observe(\.token, options: [.initial]) { [weak self] (model, change) in
            print("token Observation in app-reactions")

            let defaults = UserDefaults.standard
            defaults.set("\(model.token)", forKey: "app.token")
        }

    }
}

