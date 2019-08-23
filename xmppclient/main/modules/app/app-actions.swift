import Foundation

func tokenExist() -> Bool {
    if controller().state.app.token.isEmpty {
       return false
    }
    return true
}

func nav(props: String) {

}