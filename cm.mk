# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_RELEASE_NAME := glacier

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/glacier/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH  := 480

# Device naming
PRODUCT_DEVICE := glacier
PRODUCT_NAME := cm_glacier
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Glacier
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_glacier BUILD_FINGERPRINT=tmous/htc_pyramid/pyramid:4.0.3/IML74K/356011.14:user/release-keys PRIVATE_BUILD_DESC="3.32.531.14 CL356011 release-keys" BUILD_NUMBER=356011
