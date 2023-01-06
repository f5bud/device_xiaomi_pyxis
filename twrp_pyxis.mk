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

DEVICE_PATH := device/xiaomi/pyxis

# -----------------------------------------------
# Inherit from those products. Most specific first.
# -----------------------------------------------
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
################ $(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# -----------------------------------------------
# Inherit from pyxis device
# -----------------------------------------------
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# -----------------------------------------------
# Inherit from our custom product configuration
# -----------------------------------------------
$(call inherit-product, vendor/twrp/config/common.mk)

# -----------------------------------------------
# Device identifier. This must come after all inclusions
# -----------------------------------------------
PRODUCT_DEVICE := pyxis
PRODUCT_NAME   := twrp_pyxis
PRODUCT_BRAND  := Xiaomi
PRODUCT_MODEL  := Mi9Lite
PRODUCT_MANUFACTURER := xiaomi
