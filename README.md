# getou_
Its pretty much a hackpad but i made it myself

Here's the Zine!
<div align="center">
  <img src="Zine/Zine.png" alt="Zine Cover" width="400">
</div>

( This needs manual review cuz fallout project )

## HOW THIS WAS MADE
Firmware was made in C via qmk, the accompanying app was made in swift with the help of chatgpt

## Here's how to compile and flash the project
1. Clone the source code to your device
```bash
git clone https://github.com/gnahiak2/getou_.git
cd getou_
```


2. Compile firmware
```bash
qmk compile -kb getou_ -km default
```

3. Plug in your USB-C Cable while holding the Boot button (marked B)

4. Drag the .uf2 file into the RP2040 and you're done!


## AI DISCLOSURE
AI was used for QMK


## Images
<img src="Images/getou_pcbback.png" alt="PCB Back" width="400">


<img src="Images/getou_pcbfront.png" alt="PCB front" width="400">


<img src="Images/getou_render.png" alt="Render" width="400">
