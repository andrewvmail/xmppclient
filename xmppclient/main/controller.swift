import Foundation
import UIKit
import Starscream

class Controller {
    var state: State!
    var socket: WebSocket!
    var tabbar: Tab!
    var window: UIWindow!
    var navigationbar: UINavigationBar!
    var navigationcontroller = UINavigationController()
    var navigation : UINavigationController!


    init() {
        state = State()
        #if DEBUG
        connectToDebuger()
        #endif
    }

    func afterInit() {
        print("afterInit")
        window?.rootViewController = navigationcontroller
        navigation = window?.rootViewController as? UINavigationController
        window?.makeKeyAndVisible()
        navigation.view.backgroundColor = UIColor(red:247, green:247, blue:247, alpha:1)
        navigation.isNavigationBarHidden = true;
        navigation.navigationItem.largeTitleDisplayMode = .automatic
        run(sequence: bootstrapSequence, name: "bootstrapSequence")
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
}

