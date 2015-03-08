# CM
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# Proprietary vendor tree
$(call inherit-product, vendor/htc/primou/primou-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/primou/overlay

COMMON_PATH := device/htc/primou

# Ramdisk
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/init.primou.rc:root/init.primou.rc \
	$(COMMON_PATH)/rootdir/ueventd.primou.rc:root/ueventd.primou.rc \
	$(COMMON_PATH)/rootdir/fstab.primou:root/fstab.primou

# ACDB
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/etc/firmware/default.acdb:system/etc/firmware/default.acdb \
	$(COMMON_PATH)/rootdir/system/etc/firmware/default_org.acdb:system/etc/firmware/default_org.acdb


# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    $(COMMON_PATH)/rootdir/system/etc/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    $(COMMON_PATH)/rootdir/system/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    $(COMMON_PATH)/rootdir/system/etc/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv 

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/primou-keypad.kl:system/usr/keylayout/primou-keypad.kl \
	$(COMMON_PATH)/rootdir/system/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
	$(COMMON_PATH)/rootdir/system/usr/idc/primou-keypad.idc:system/usr/idc/primou-keypad.idc \
	$(COMMON_PATH)/rootdir/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc


# Call BCM4330 firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)


# BCM4330 firmware
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_apsta_b1.bin:system/vendor/firmware/fw_bcm4330_apsta_b1.bin \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_apsta_b2.bin:system/vendor/firmware/fw_bcm4330_apsta_b2.bin \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_b2.bin:system/vendor/firmware/fw_bcm4330_b2.bin \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_b1.bin:system/vendor/firmware/fw_bcm4330_b1.bin \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_p2p_b2.bin:system/vendor/firmware/fw_bcm4330_p2p_b2.bin \
	$(COMMON_PATH)/rootdir/system/vendor/firmware/fw_bcm4330_p2p_b1.bin:system/vendor/firmware/fw_bcm4330_p2p_b1.bin

# Lights / Sensors / GPS / Bluetooth
PRODUCT_PACKAGES += \
	lights.primou \
	sensors.primou \
	gps.primou \
	libbt-vendor

# Audio properties
PRODUCT_PROPERTY_OVERRIDES += \
	media.a1026.nsForVoiceRec=0 \
	media.a1026.enableA1026=0 \
	htc.audio.alt.enable=0 \
	htc.audio.hac.enable=1



# Device uses high-density artwork where available
PRODUCT_LOCALES += en_US
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


# Disable ADB authentication and use root shell
#ADDITIONAL_DEFAULT_PROPERTIES += \
#    ro.adb.secure=0 \
#    ro.secure=0

