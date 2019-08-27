import Foundation
import UIKit
import Starscream

class Controller {
    var state: State!
    var socket: WebSocket!
    var window: UIWindow!
    var navigationbar: UINavigationBar!
    var navigationcontroller = UINavigationController()
    var navigation: UINavigationController!
    let db = Database()
    let http = Http()

    var appReactions: AppReactions!


    init() {
        state = State()
        #if DEBUG
        connectToDebuger()
        #endif
    }

    func setupReactions() {
        self.appReactions = AppReactions()
    }

    // func getModule(name: String) -> NSObject? {
    //     if (name.contains("app")) {
    //         return self.state?.app
    //     }
    // }


    func afterInit() {
        print("afterInit")
        window?.rootViewController = navigationcontroller
        navigation = window?.rootViewController as? UINavigationController
        window?.makeKeyAndVisible()
        navigation.view.backgroundColor = UIColor(red: 247, green: 247, blue: 247, alpha: 1)
        navigation.isNavigationBarHidden = true;
        navigation.navigationItem.largeTitleDisplayMode = .automatic
        run(sequence: bootstrapSequence, name: "bootstrapSequence")
        self.hydrate()
        // self.setupReactions()
    }

    func connectToDebuger() {
        print("init controller")
        socket = WebSocket(url: URL(string: "ws://localhost:8080/")!)
        socket.onConnect = {
            print("websocket is connected")
        }
        socket.onDisconnect = { (error: Error?) in
            print("websocket is disconnected: \(error?.localizedDescription)")
        }
        socket.onText = { (text: String) in
            print("got some text: \(text)")
        }
        socket.onData = { (data: Data) in
            print("got some data: \(data.count)")
        }
        socket.connect()
        socket.write(string: "Hi Server!")
    }

    func hydrate() {
        let syncKeys = sync().keys
        // Swift 3 and after

        let defaults = UserDefaults.standard

        defaults.set("123123123", forKey: "app.token")

        for key in syncKeys {
            print("\(key.value) is from \(key.key)")


            if let value = defaults.string(forKey: "\(key.key).\(key.value)") {
                print("got a value !!", value)
                // hydrate the value

                if(key.key.contains("app")) {

                    print("===")
                    state.app.setValue(value, forKeyPath: key.value)
                    print(state.app.token)
                    print("-===")
                }

                // controller()[keyPath: "app"]["token"] = value

                 // self.getModule(name: key.key) {
                //
                // }
            }
        }

        // let mirrored_object = Mirror(reflecting: syncKeys)
        // for (index, attr) in mirrored_object.children.enumerated() {
        //     if let property_name = attr.label as String? {
        //         print("Attr \(index): \(property_name) = \(attr.value)")
        //         if let k = defaults.string(forKey: "app.token") {
        //             print(k, "=================", property_name)
        //
        //             print(state[property_name])
        //
        //             if ((attr.value as! String).contains("app.")) {
        //                 let appState = state[property_name] as! AppState
        //                 appState.token = k
        //                 // appState["token"] = k;
        //             }
        //
        //
        //             // print((state[property_name] as! NSObject?)?.value(forKey: attr.value as! String))
        //
        //         }
        //     }
        // }

    }
}

