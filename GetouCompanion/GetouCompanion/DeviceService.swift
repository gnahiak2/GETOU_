//
//  DeviceService.swift
//  GetouCompanion
//

import Foundation

final class DeviceService {
    // TODO: Replace stub with IOHIDManager-based enumeration.
    // We'll start with a heuristic that includes the QMK example VID/PID in Firmware/keyboard.json:
    //   vid: 0xFEED, pid: 0x1234

    func stubDevices() -> [KeyboardDevice] {
        [
            .init(id: UUID(), vid: 0xFEED, pid: 0x1234, product: "getou_ (stub)", manufacturer: "Kaihang")
        ]
    }
}
