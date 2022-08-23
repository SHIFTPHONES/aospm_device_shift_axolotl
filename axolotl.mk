# Inherit the full_base and device configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/shift/axolotl/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Product overrides
PRODUCT_BRAND  := AOSP
PRODUCT_DEVICE := axolotl
PRODUCT_NAME   := axolotl
