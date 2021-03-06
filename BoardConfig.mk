#
# Copyright (C) 2012-2014 The CyanogenMod Project
# by Cholokei - leesl0416@naver.com
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

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/quincykt/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# Assert
TARGET_OTA_ASSERT_DEVICE := SHV-E160K,quincykt

# Kernel
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom usb_id_pin_rework=true zcache
BOARD_KERNEL_BASE           := 0x48000000
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x01400000
BOARD_KERNEL_PAGESIZE       := 2048
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common
TARGET_KERNEL_CONFIG        := cyanogenmod_quincykt_defconfig

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
#BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p29
#BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
#BOARD_USES_MMCUTILS := true
#BOARD_HAS_NO_MISC_PARTITION := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true

# For KOR Q1 vold
BOARD_VOLD_KOR_QUINCY := true

# Q1 hardware has a rear mic for camcorder
BOARD_HAVE_BACK_MIC_CAMCORDER := true

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/quincykt/bluetooth

