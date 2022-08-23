ifneq ($(filter axolotl, $(TARGET_DEVICE)),)

IMAGE_GZ := device/shift/axolotl-kernel/Image.gz
DTB := $(wildcard device/shift/axolotl-kernel/*.dtb)

$(PRODUCT_OUT)/kernel: $(IMAGE_GZ) $(DTB)
	cat $(IMAGE_GZ) $(DTB) > $@

droidcore: $(PRODUCT_OUT)/kernel

endif
