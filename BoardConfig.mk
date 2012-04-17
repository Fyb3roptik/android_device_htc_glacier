# Copyright (C) 2012 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/glacier/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := glacier

# Camera Params
BOARD_HAVE_HTC_FFC := true
BOARD_USE_REVERSE_FFC := true
POS_HTC_CAMERA := true

BOARD_USE_LEGACY_TRACKPAD := true
BOARD_USE_LEGACY_TOUCHSCREEN := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x04000000
BOARD_KERNEL_PAGE_SIZE := 4096

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := glacier

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/htc-kernel-msm7x30
TARGET_KERNEL_CONFIG := cyanogen_msm7230_defconfig
#TARGET_PREBUILT_KERNEL := device/htc/msm7x30-common/msm7230/kernel
#TARGET_KERNEL_MODULES := device/htc/msm7x30-common/msm7230/bcm4329.ko

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 435941376
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1232072704
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x30-common/include
