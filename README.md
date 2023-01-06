# Device tree for Xiaomi Mi 9 Lite
## ** To build OrangeFox recovery
1) create a directory and go there
2) goto https://gitlab.com/OrangeFox/sync and read instructions
3) sync with branch 12.1
4) Copy (device_xiaomi_pyxis files) in device/xiaomi/pyxis
## ** To build TWPR recovery
1) create a directory and go there
2) repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
3) repo sync -c --force-sync --prune --no-clone-bundle --no-tags
4) Copy (device_xiaomi_pyxis files) in device/xiaomi/pyxis
## For standard partition comment in device.mk
- BOARD_USES_METADATA_PARTITION  := true
- PRODUCT_USE_DYNAMIC_PARTITIONS := true
- PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true
## For dymanic partition leave these 3 lines
## ** To compile:
- export ALLOW_MISSING_DEPENDENCIES=true
- export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
- export LC_ALL="C"
- export USE_CCACHE=1
- source build/envsetup.sh
- croot
- lunch twrp_pyxis-eng && mka adbd recoveryimage

## Result in out/target/product/pyxis/recovery.img

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

## Device picture

![Xiaomi Mi 9 Lite](https://camo.githubusercontent.com/861a6ed140e19383f649a937bda46cf749b0ec0d91b7aab4ae5fe02415368f21/68747470733a2f2f66646e322e67736d6172656e612e636f6d2f76762f706963732f7869616f6d692f7869616f6d692d6d692d6363392d322e6a7067 "Xiaomi Mi 9 Lite")
