#
# Copyright (C) 2021-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/xiaomi/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/fuxi

# Assert
TARGET_OTA_ASSERT_DEVICE := fuxi

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_DIR := $(DEVICE_PATH)-kernel
KERNEL_MODULE_DIR := $(TARGET_KERNEL_DIR)/modules

BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)
BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_DIR)/dtbo.img
TARGET_PREBUILT_DTB := $(TARGET_KERNEL_DIR)/dtb
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/kernel

# Kernel modules
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_DIR)/*.ko)

BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_DIR)/, $(notdir $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)))

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/xiaomi/fuxi/BoardConfigVendor.mk
