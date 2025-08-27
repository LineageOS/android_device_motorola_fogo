#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from fogos device
$(call inherit-product, device/motorola/fogo/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_fogo
PRODUCT_DEVICE := fogo
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g 5G - 2024

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
<<<<<<< HEAD   (552085 fogo: Update to U1UFNS34.41-98-3-19)
    BuildDesc="fogo_g-user 14 U1UFNS34.41-98-3-19 7ab7a1-86d9da release-keys MUR1-0.252" \
    BuildFingerprint=motorola/fogo_g/fogo:14/U1UFNS34.41-98-3-19/7ab7a1-86d9da:user/release-keys \
=======
    BuildDesc="fogo_g-user 15 V1UFN35H.193-20 3119bc-9f63b release-keys MV-304" \
    BuildFingerprint=motorola/fogo_g/fogo:15/V1UFN35H.193-20/3119bc-9f63b:user/release-keys \
>>>>>>> CHANGE (8b1d22 fogo: Update to V1UFN35H.193-20)
    DeviceProduct=fogo_g
