#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Screen
TARGET_SCREEN_DENSITY := 280

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 280dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# Inherit from motorola sm6375-common
$(call inherit-product, device/motorola/sm6375-common/common.mk)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageApertureAppDevice \
    LineagePlatformDevice \
    ProductFrameworksResDevice \
    SystemUIResDevice \
    WifiResDevice

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.lahaina \
    firmware_aw_cali.bin_symlink

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# FM
TARGET_HAS_FM := true

PRODUCT_PACKAGES += \
    FM2

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.oem.fingerprint2.sh

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

# LiveDisplay
$(call soong_config_set,livedisplay_sysfs,enable_ab,true)

# Lineage Health
$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/power_supply/battery/input_current_limit)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    Tag

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Power
$(call soong_config_set,qtipower,tap_to_wake_node,/sys/class/touchscreen/primary/gesture)

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/fogo/fogo-vendor.mk)
