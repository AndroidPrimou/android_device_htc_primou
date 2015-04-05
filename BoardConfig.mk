# Inherit common msm7x30 configs
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/htc/primou/BoardConfigVendor.mk


TARGET_BOOTLOADER_BOARD_NAME := primou

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.hardware=htc7x30 androidboot.selinux=permissive
# cmdline for recovery:
#BOARD_KERNEL_CMDLINE := no_console_suspend=1 androidboot.hardware=qcom androidboot.selinux=permissive msmsdcc_power_gpio=88
BOARD_KERNEL_BASE := 0x13F00000
BOARD_KERNEL_PAGE_SIZE := 4096

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p25: 31dffe00 00000200 "system"
#mmcblk0p28: 0afffe00 00000200 "cache"
#mmcblk0p26: 3cfffe00 00000200 "userdata"
#mmcblk0p29: 017ade00 00000200 "devlog"
#mmcblk0p31: 00040000 00000200 "pdata"
#mmcblk0p30: 00011c00 00000200 "extra"
#mmcblk0p32: 05ffe000 00000200 "fat"
#mmcblk0p27: 07fffe00 00000200 "swap"


#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 585101312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1232072704
BOARD_BOOTIMAGE_PARTITION_SIZE := 6194304
BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_KERNEL_SOURCE := kernel/htc/msm7x30-androidprimou
#TARGET_KERNEL_SOURCE := kernel/htc/msm7x30-odp-patches
TARGET_KERNEL_CONFIG := primou_defconfig
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8
#TARGET_PREBUILT_KERNEL := device/htc/primou/prebuilt/kernel/kernel

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun0/file
BOARD_VOLD_MAX_PARTITIONS := 36

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/primou/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/htc/primou/bluetooth/libbt_vndcfg.txt

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := primou
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000


# Recovery
TARGET_RECOVERY_FSTAB = device/htc/msm7x30-common/rootdir/fstab.htc7x30
RECOVERY_FSTAB_VERSION := 2

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# TWRP
RECOVERY_VARIANT := twrp
TW_THEME := portrait_mdpi
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_INCLUDE_CRYPTO := true
#TW_USE_TOOLBOX := true
#TW_NO_SCREEN_BLANK := true
#TW_NO_CPU_TEMP := true
TARGET_RECOVERY_DEVICE_MODULES := chargeled
