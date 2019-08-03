import Foundation
import UIKit
import Starscream

class Controller {
    var state: State!
    var socket: WebSocket!

    init() {
        self.state = State.init()
        #if DEBUG
        connectToDebuger()
        #endif
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