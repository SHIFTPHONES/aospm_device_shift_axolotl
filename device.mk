# Inherit from generic parts
$(call inherit-product, device/generic/sdm845/axolotl/device.mk)
$(call inherit-product, device/generic/sdm845/shared/device.mk)

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/shift/axolotl-kernel/Image.gz
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
