# Copyright (C) 2023 The LineageOS Project

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.mmi.shutdown.sh \
    pstore_annotate.sh \
    init.qcom.sh \
    init.qti.chg_policy.sh \
    init.class_main.sh \
    hardware_revisions.sh \
    vendor_modprobe.sh \
    init.qcom.post_boot.sh \
    init.mmi.usb.sh \
    init.qcom.usb.sh \
    init.qti.kernel.debug-holi.sh \
    apanic_annotate.sh \
    init.qti.kernel.sh \
    init.qti.qcv.sh \
    init.oem.fingerprint.overlay.sh \
    init.crda.sh \
    init.qti.media.sh \
    init.kernel.post_boot.sh \
    init.mmi.block_perm.sh \
    init.kernel.post_boot-blair.sh \
    init.kernel.post_boot-holi.sh \
    init.qcom.coex.sh \
    init.oem.fingerprint2.sh \
    init.qti.kernel.debug.sh \
    apanic_copy.sh \
    init.mmi.mdlog-getlogs.sh \
    init.mdm.sh \
    init.qti.display_boot.sh \
    init.qcom.efs.sync.sh \
    apanic_save.sh \
    init.qti.kernel.debug-blair.sh \
    init.qcom.sensors.sh \
    init.mmi.wlan-getlogs.sh \
    init.qcom.class_core.sh \
    init.mmi.boot.sh \
    init.mmi.modules.sh \
    qca6234-service.sh \
    init.qcom.early_boot.sh \
    init.qcom.sdio.sh \
    init.oem.hw.sh \
    init.gbmods.sh \
    init.mmi.touch.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    init.qcom.rc \
    init.mmi.chipset.rc \
    init.mmi.debug.rc \
    init.qti.kernel.rc \
    init.qcom.factory.rc \
    init.mmi.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.tcmd.rc \
    init.mmi.overlay.rc \
    init.mmi.diag.rc \
    init.qcom.usb.rc \
    init.qti.ufs.rc \
    init.mmi.charge_only.rc \
    init.mmi.usb.rc \
    init.mmi.wlan.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.qcom

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/milanf/milanf-vendor.mk)
