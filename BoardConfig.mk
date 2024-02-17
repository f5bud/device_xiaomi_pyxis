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
# Architecture
# -----------------------------------------------
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385

# -----------------------------------------------
# Avb
# -----------------------------------------------
BOARD_AVB_ENABLE := true

ifeq ($(BOARD_AVB_ENABLE), true)
	BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
	BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
	BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
	BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
endif

# -----------------------------------------------
# CRYPT SECURITY don't touch this values !!!
# -----------------------------------------------
PLATFORM_VERSION := 14
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH   := $(PLATFORM_SECURITY_PATCH)

# -----------------------------------------------
# Bootloader
# -----------------------------------------------
TARGET_USES_UEFI             := true
TARGET_USES_64_BIT_BINDER    := true
TARGET_NO_BOOTLOADER         := true
TARGET_BOARD_PLATFORM        := sdm710
TARGET_BOOTLOADER_BOARD_NAME := sdm710

# -----------------------------------------------
# Dtbo in recovery.img
# -----------------------------------------------
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_PROVIDES_DTBOIMAGE   := true

# -----------------------------------------------
# Kernel
# -----------------------------------------------
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xA90000

BOARD_MKBOOTIMG_ARGS += --base 0x00000000
BOARD_MKBOOTIMG_ARGS += --header_version 2
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x01000000
BOARD_MKBOOTIMG_ARGS += --tags_offset 0x00000100

# -----------------------------------------------
# Partitions
# -----------------------------------------------
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE       := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 67108864

BOARD_USERDATAIMAGE_PARTITION_SIZE   := 114898743296
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

ifeq ($(PRODUCT_USE_DYNAMIC_PARTITIONS),true)
	# Partitions - dynamic
	BOARD_SUPER_PARTITION_GROUPS          := qti_dynamic_partitions
	BOARD_SUPER_PARTITION_BLOCK_DEVICES   := system vendor cust
	BOARD_SUPER_PARTITION_METADATA_DEVICE := system

	BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3758096384
	BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1610612736
	BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE   := 1073741824
	BOARD_SUPER_PARTITION_SIZE               := 6442450944

	# (BOARD_SUPER_PARTITION_SIZE - 4MB)
	BOARD_QTI_DYNAMIC_PARTITIONS_SIZE        := 6442446848

	TARGET_PREBUILT_KERNEL   := $(DEVICE_PATH)/prebuilt.dyn/Image.gz
	BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt.dyn/dtbo.img

	BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)/prebuilt.dyn/sdm710.dtb

	TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/prebuilt.dyn/recovery.fstab
else
	# Partitions - standard
	BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3473383800
	BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4

	BOARD_VENDORIMAGE_PARTITION_SIZE   := 1225269552
	BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

	TARGET_PREBUILT_KERNEL   := $(DEVICE_PATH)/prebuilt.std/Image.gz
	BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt.std/dtbo.img

	BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)/prebuilt.std/sdm710.dtb

	TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/prebuilt.std/recovery.fstab
endif
# -----------------------------------------------
# Recovery
# -----------------------------------------------
TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_RECOVERY_DEVICE_MODULES += \
	libion \
	libprocinfo \
	libxml2 \
	vendor.display.config@1.0 \
	vendor.display.config@2.0

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libprocinfo.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
	$(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
	$(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
