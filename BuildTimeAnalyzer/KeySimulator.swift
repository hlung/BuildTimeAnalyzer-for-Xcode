import Foundation

extension CGKeyCode {
    static var down: CGKeyCode = 125
    static var up: CGKeyCode = 126
}

class KeySimulator {
    static func send(_ keyCode: CGKeyCode, withCommand: Bool = false) {
        let sourceRef = CGEventSource(stateID: .combinedSessionState)

        if sourceRef == nil {
            NSLog("FakeKey: No event source")
            return
        }

        let keyDownEvent = CGEvent(keyboardEventSource: sourceRef,
                                   virtualKey: keyCode,
                                   keyDown: true)
        if withCommand {
            keyDownEvent?.flags = .maskCommand
        }

        let keyUpEvent = CGEvent(keyboardEventSource: sourceRef,
                                 virtualKey: keyCode,
                                 keyDown: false)

        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
}
