#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/glacier/ramdisk/init.glacier.rc:root/init.glacier.rc \
    device/htc/glacier/ramdisk/init.glacier.usb.rc:root/init.glacier.usb.rc \
    device/htc/glacier/ramdisk/ueventd.glacier.rc:root/ueventd.glacier.rc \
    device/htc/glacier/ramdisk/glacier.fstab:root/glacier.fstab

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/glacier/device-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=4.0_r1 \
    ro.setupwizard.enable_bypass=1 \
    debug.camcorder.disablemeta=1

# HTC Audio related
PRODUCT_PROPERTY_OVERRIDES += \
    htc.audio.alt.enable=0 \
    htc.audio.hac.enable=0 \
    media.a1026.nsForVoiceRec=0 \
    media.a1026.enableA1026=1 \

PRODUCT_PACKAGES += \
    lights.glacier \
    sensors.glacier \
    gps.glacier

# Wifi Calling
PRODUCT_PACKAGES += \
    GanOptimizer

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/glacier/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/glacier/prebuilt/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl

# IDC Files
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/glacier/prebuilt/idc/glacier-keypad.idc:system/usr/idc/glacier-keypad.idc \
    device/htc/glacier/prebuilt/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keychars/glacier-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/glacier/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/glacier/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/glacier/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/glacier/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb

# Vold
PRODUCT_COPY_FILES += \
    device/htc/glacier/vold.fstab:system/etc/vold.fstab

# Fix bcm4329 firmware
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# dalvik heap settings
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
