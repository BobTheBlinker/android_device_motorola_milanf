# Copyright (C) 2023 The LineageOS Project

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from milanf device
$(call inherit-product, device/motorola/milanf/device.mk)

PRODUCT_DEVICE := milanf
PRODUCT_NAME := lineage_milanf
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g stylus 5G (2022)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="milanf_g-user 11 S2SDS32.21-85-3-5 497f85 release-keys"

BUILD_FINGERPRINT := motorola/milanf_g/milanf:11/S2SDS32.21-85-3-5/497f85:user/release-keys
