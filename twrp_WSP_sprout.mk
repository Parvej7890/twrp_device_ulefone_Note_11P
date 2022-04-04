#
# Copyright (C) 2020 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from star device
$(call inherit-product, device/nokia/WSP_sprout/device.mk)

# Inherit some common recovery stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := WSP_sprout
PRODUCT_NAME := twrp_WSP_sprout
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := 2.2
PRODUCT_MANUFACTURER := HMD Global

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=Note_11P \
    PRODUCT_NAME=Note_11P \
    PRIVATE_BUILD_DESC="full_g2062upt_v1_gd_sh2_gq_r-user 11 RP1A.200720.011 2106051247 release-keys"

BUILD_FINGERPRINT := Ulefone/Note_11P/Note_11P:11/RP1A.200720.011/2106051247:user/release-keys

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
