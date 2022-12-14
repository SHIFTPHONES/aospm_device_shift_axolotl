#
# Copyright (C) 2022 SHIFT GmbH
#
# SPDX-License-Identifier: Apache-2.0
#

# Use the non-open-source parts, if they're present
-include vendor/shift/proprietary/axolotl/BoardConfigVendor.mk

include device/generic/sdm845/shared/BoardConfig.mk
#include device/generic/sdm845/axolotl/BoardConfig.mk
##############################################
# device/generic/sdm845/axolotl/BoardConfig.mk
#

# Board Information
TARGET_BOOTLOADER_BOARD_NAME := axolotl
TARGET_BOARD_PLATFORM := axolotl
TARGET_SCREEN_DENSITY := 400

# Kernel/boot.img Configuration
BOARD_KERNEL_CMDLINE += androidboot.hardware=axolotl

##### Partition handling

BOARD_DYNAMIC_PARTITION_ENABLE := true
TARGET_USE_DYNAMIC_PARTITIONS := true

# Define the Dynamic Partition sizes and groups.
BOARD_SUPER_PARTITION_SIZE := 12884901888
BOARD_SUPER_PARTITION_GROUPS := axolotl_dynamic_partitions
BOARD_AXOLOTL_DYNAMIC_PARTITIONS_SIZE := 6438256640
BOARD_AXOLOTL_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    product \
    system \
    system_ext \
    vendor \

# Set error limit to BOARD_SUPER_PARTITON_SIZE - 500MB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 12360613888

# boot.img
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000

# metadata.img
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_USES_METADATA_PARTITION := true

# product.img
BOARD_USES_PRODUCTIMAGE := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product

# recovery.img
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06000000

# super.img
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true

# system_ext.img
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# userdata.img
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
# Stock ships with F2FS but we force it to ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

#
# device/generic/sdm845/axolotl/BoardConfig.mk
##############################################

KERNEL_MODS := $(wildcard device/shift/axolotl-kernel/*.ko)

# Following modules go to vendor partition
VENDOR_KERN_MODS :=
BOARD_VENDOR_KERNEL_MODULES := $(filter $(VENDOR_KERN_MODS),$(KERNEL_MODS))

# All other modules go to ramdisk
BOARD_GENERIC_RAMDISK_KERNEL_MODULES := $(filter-out $(VENDOR_KERN_MODS),$(KERNEL_MODS))
