class CallingSequence {
    init(_ sequenceName: String) {
        sendSequenceToDebugger(name: sequenceName)
    }

    func clickCall() {
        run(sequence: navSequence, name: "nav", props: "InCallPage")
    }
}
