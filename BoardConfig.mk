#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8550-common
include device/samsung/sm8550-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/dm3q

# Display
TARGET_SCREEN_DENSITY := 440

# OTA assert
TARGET_OTA_ASSERT_DEVICE := dm3q

# Inherit proprietary blobs
include vendor/samsung/dm3q/BoardConfigVendor.mk
