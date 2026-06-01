import Foundation

final class DeviceService {

    func stubDevices() -> [KeyboardDevice] {
        [
            KeyboardDevice(
                id: UUID(),
                vid: 0xFEED,
                pid: 0x1234,
                product: "Getou Macropad",
                manufacturer: "Kaihang"
            )
        ]
    }
}