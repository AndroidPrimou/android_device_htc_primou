# Copyright (C) 2011-2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Proprietary vendor tree
$(call inherit-product, vendor/htc/primou/primou-vendor.mk)

# Inherit common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)


DEVICE_PACKAGE_OVERLAYS += device/htc/primou/overlay

COMMON_PATH := device/htc/primou

# Boot ramdisk setup
PRODUCT_PACKAGES += init.target.rc

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
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)


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
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US


# Disable ADB authentication and use root shell
#ADDITIONAL_DEFAULT_PROPERTIES += \
#	ro.adb.secure=0 \
#	ro.secure=0

# Call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Lower the increment
ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.heapgrowthlimit=36m
