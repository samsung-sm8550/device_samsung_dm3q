#
# Copyright (C) 2023 The Android Open Source Project
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
#

# PRODUCT_COPY_FILES directives.
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Manifest
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kalama
TARGET_NO_BOOTLOADER := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kalama
QCOM_BOARD_PLATFORMS += kalama

# File systems
TARGET_USES_MKE2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/dm3q/bootimg.mk

TARGET_PREBUILT_KERNEL := device/samsung/dm3q/prebuilt/Image.gz
TARGET_PREBUILT_DTB := device/samsung/dm3q/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := device/samsung/dm3q/prebuilt/dtbo
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_ARCH := arm64

BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	printk.devkmsg=on \
	firmware_class.path=/vendor/firmware_mnt/image \
	bootconfig \
	androidboot.hardware=qcom \
	androidboot.memcg=1 \
	androidboot.usbcontroller=a600000.dwc3 \
	loop.max_part=7 \
	androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_MKBOOTIMG_ARGS := \
	--board "SRPVH05C003" \
	--dtb $(TARGET_PREBUILT_DTB) \
	--dtb_offset $(BOARD_DTB_OFFSET) \
	--header_version $(BOARD_BOOT_HEADER_VERSION) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# System as root
BOARD_ROOT_EXTRA_FOLDERS := \
	cache \
	carrier \
	data_mirror \
	efs \
	linkerconfig \
	odm_dlkm \
	oem \
	optics \
	postinstall \
	prism \
	second_stage_resources \
	spu \
	system_ext \
	vendor_dlkm

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 12664700928
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 12660506624
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system odm product system_ext vendor vendor_dlkm

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += device/samsung/dm3q/vendor.prop

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_RESETPROP := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Recovery
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone50/temp
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_MAX_BRIGHTNESS := 612
TW_DEFAULT_BRIGHTNESS := 355
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_HAPTICS := true
TW_FRAMERATE := 120

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
