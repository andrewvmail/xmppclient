import Foundation

struct sequences {
    func petMomoSequence()  {
        actions.init().add()
        actions.init().add()
    }
    func feedMomoSequence() {
        actions.init().add()
        actions.init().add()
        actions.init().add()
        actions.init().add()
        actions.init().add()
        self.petMomoSequence()
    }
}