#
# Copyright (C) 2022 SHIFT GmbH
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from generic parts
$(call inherit-product, device/generic/sdm845/axolotl/device.mk)
$(call inherit-product, device/generic/sdm845/shared/device.mk)

# Inherit vendor blobs
$(call inherit-product-if-exists, vendor/shift/proprietary/axolotl/axolotl-vendor.mk)
