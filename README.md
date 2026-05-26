# getou_ — 3×4 RP2040 Macropad

A compact fully programmable 12-key macropad powered by QMK firmware and built around the RP2040 microcontroller.

![Fully Assembled Macropad]
Not yet

---

# 🧠 What is getou_?

getou_ is a custom 3×4 mechanical macropad designed to provide fast access to shortcuts, macros, media controls, and custom workflows in an ultra-compact form factor.

Built around the RP2040 platform and powered by QMK firmware, it is fully open-source and highly customizable.

Unlike many commercial macropads, getou_ is:

- fully programmable
- open hardware
- open firmware
- lightweight and compact
- easy to build and modify

The project can function as:

- a productivity macropad
- a programmable numpad
- a media controller
- a shortcut board
- a small stream deck alternative

---

# 💡 Why I made this

I wanted a macropad that was:

- small but still powerful
- fully customizable through QMK
- inexpensive to build
- easy to modify and experiment with

Many existing macropads are expensive or locked behind proprietary software ecosystems.

getou_ was created as an open alternative that anyone can build, flash, and customize.

This project also gave me experience with:

- PCB design
- keyboard matrix design
- QMK firmware
- RP2040 development
- CAD modeling
- hardware prototyping

---

# 🧩 Features

- 12-key 3×4 layout
- RP2040 based
- QMK firmware support
- Fully programmable layers/macros
- NKRO support
- USB-C connectivity
- Easy UF2 firmware flashing
- Compact custom PCB
- Open-source hardware and firmware

---

# ⌨️ Hardware

## Main Components

| Component | Description |
|---|---|
| RP2040 | Main microcontroller |
| MX-compatible switches | Mechanical keyboard switches |
| Diodes | Matrix isolation |
| USB-C connector | Power + data |
| Custom PCB | Designed in KiCad |

---

# 🖼️ Images

## Fully Assembled Macropad

![Assembled]
not yet

---

## PCB

![PCB Front]
same

![PCB Back]
also

---

## 3D Render

![3D Render]
not yet too

---

# 🔌 Firmware

The macropad uses QMK firmware.

## Building Firmware

```bash
qmk compile -kb getou_ -km default
```

## Flashing Firmware

1. Connect the RP2040 board via USB
2. Enter bootloader mode
3. Drag and drop the generated `.uf2` firmware file

---

# 📁 Repository Structure

```text
getou_/
├── CAD/                 # CAD files and models
├── Firmware/            # QMK firmware files
├── GetouCompanion/      # Companion software
├── KiCAD/               # PCB design files
├── images/              # README images
├── BOM.csv              # Bill of materials
├── README.md
└── LICENSE
```

---

# 🛠️ Companion Software

The repository also includes `GetouCompanion`, a companion application used for interacting with and configuring the macropad.

Current work includes:

- profile management
- configuration tools
- improved usability features

---

# 🚀 Future Plans

- RGB support
- Rotary encoder support
- VIA/VIAL compatibility
- More layout options
- OLED display support
- Improved desktop companion software

---

# 📜 License

Licensed under the MIT License.
