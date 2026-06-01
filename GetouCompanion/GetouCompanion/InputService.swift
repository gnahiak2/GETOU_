import Foundation

final class InputService {

    var onKeyPress: ((Int) -> Void)?

    init() {
        // Placeholder:
        // Later replace with IOHIDManager
        simulateInput()
    }

    private func simulateInput() {
        // TEMP TEST ONLY
    }

    func handleKey(_ keyIndex: Int) {
        onKeyPress?(keyIndex)
    }
}