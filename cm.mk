# Copyright (C) 2015 The CyanogenMod Project
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
# Inherit device configuration

# Inherit device configuration
$(call inherit-product, device/htc/primou/full_primou.mk)

# Inherit common CM configuration
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=htc_primou \
	BUILD_FINGERPRINT="htc_wwe/htc_primou/primou:$(PLATFORM_VERSION)/$(BUILD_ID)/$(shell date +%Y%m%d%H%M%S):$(TARGET_BUILD_VARIANT)/test-keys" \
	PRIVATE_BUILD_DESC="htc_primou-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) $(shell date +%Y%m%d%H%M%S) test-keys"

# Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_primou
PRODUCT_GMS_CLIENTID_BASE := android-htc-rev

# Release name
PRODUCT_RELEASE_NAME := primou
