# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# -----------------------------------------------
# File systems
# -----------------------------------------------
BOARD_HAS_NO_REAL_SDCARD       := true
RECOVERY_SDCARD_ON_DATA        := true

# -----------------------------------------------
# Dynamic partitions
# -----------------------------------------------
# FOR STANDART PARTITION COMMENT THIS
# -----------------------------------------------
BOARD_USES_METADATA_PARTITION  := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# -----------------------------------------------
# fastbootd
# -----------------------------------------------
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock \
	android.hardware.fastboot@1.0-impl-mock.recovery \
	fastbootd

# -----------------------------------------------
# Soong namespaces
# -----------------------------------------------
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# -----------------------------------------------
# TWRP specific build flags
# -----------------------------------------------
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_ENCRYPTED_BACKUPS:= false
TW_EXCLUDE_PYTHON           := true
TW_INCLUDE_CRYPTO_FBE       := true
TW_INCLUDE_CRYPTO           := true
TW_INCLUDE_FASTBOOTD        := true
TW_INCLUDE_RESETPROP        := true
TW_USE_FSCRYPT_POLICY       := 1
TW_USE_TOOLBOX              := true

TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone6/temp"
TW_DEFAULT_BRIGHTNESS   := 800
TW_H_OFFSET             := -80
TW_INPUT_BLACKLIST      := "hbtp_vm"
TW_MAX_BRIGHTNESS       := 2047
TW_THEME                := portrait_hdpi
TW_Y_OFFSET             :=  80

ifeq ($(PRODUCT_USE_DYNAMIC_PARTITIONS),true)
	TW_DEVICE_VERSION := 'Pyxis-DynPart'
else
	TW_DEVICE_VERSION := 'Pyxis-StdPart'
endif
# -----------------------------------------------
# TWRP Debugging
# -----------------------------------------------
TARGET_USES_LOGD    := true
TWRP_EVENT_LOGGING  := false
TWRP_INCLUDE_LOGCAT := true
