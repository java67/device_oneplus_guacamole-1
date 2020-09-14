#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, device/oneplus/sm8150-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/oneplus/guacamole/guacamole-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-statix

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-statix/frameworks/base/packages/SystemUI

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_11811.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_11811.xml \
    $(LOCAL_PATH)/audio/mixer_paths_pahu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_pahu.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Camera
PRODUCT_PACKAGES += \
    vendor.lineage.camera.motor@1.0 \
    vendor.lineage.camera.motor@1.0-service.oneplus_msmnile \
    OnePlusCameraHelper

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.display.guacamole.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
