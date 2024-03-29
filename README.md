# Device tree for Xiaomi Mi 9 Lite
## TWRP recovery for dymanic partition:
- export USE_CCACHE=1
- export ALLOW_MISSING_DEPENDENCIES=true
- export OUT_DIR=out.pyxis.dyn.part

- source build/envsetup.sh
- croot
- lunch twrp_pyxis-eng && mka recoveryimage

### Result in out.pyxis.dyn.part/target/product/pyxis/recovery.img

## TWRP recovery for standard partition:
- export USE_CCACHE=1
- export ALLOW_MISSING_DEPENDENCIES=true
- export OUT_DIR=out.pyxis.std.part

- source build/envsetup.sh
- croot
- lunch twrp_pyxis-eng && mka adbd recoveryimage

### Result in out.pyxis.std.part/target/product/pyxis/recovery.img

Device configuration for Xiaomi Mi 9 Lite
=========================================

The Xiaomi Mi 9 Lite (codenamed _"pyxis"_) is a middle-ranged smartphone from Xiaomi.

It was announced and released in September 2019.

## Device specifications

Basic        | Spec Sheet
------------:|:-------------------------
SoC          | Qualcomm SDM710 Snapdragon 710
CPU          | Octa-core (2x2.2 GHz Kryo 360 Gold & 6x1.7 GHz Kryo 360 Silver)
GPU          | Adreno 616
Memory       | 6 GB RAM
Storage      | 64/128 GB
Battery      | Non-removable Li-Pol 4030 mAh battery
Display      | 1080 x 2340 pixels, 19.5:9 ratio, 6.39 inches, AMOLED (~403 ppi density)
Rear Camera  | Triple 48 MP + 8 MP (UW) + 2MP (depth)
Front Camera | 32 MP
