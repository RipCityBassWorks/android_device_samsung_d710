#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include common makefile
$(call inherit-product, device/samsung/galaxys2-common/common.mk)

LOCAL_PATH := device/samsung/d710

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Proprietary blobs dependency on libstlport
PRODUCT_PACKAGES +=  libstlport

# Sensors
PRODUCT_PACKAGES += \
    sensors.exynos4

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/keylayout/max8997-muic.kl:system/usr/keylayout/max8997-muic.kl \
    $(LOCAL_PATH)/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/melfas_ts.idc:system/usr/idc/melfas_ts.idc \
    $(LOCAL_PATH)/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
    $(LOCAL_PATH)/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc
    
# Fix USB transfer speeds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Net
#PRODUCT_COPY_FILES += \
    #$(LOCAL_PATH)/configs/ip-up:system/etc/ppp/ip-up \
    #$(LOCAL_PATH)/configs/ip-down:system/etc/ppp/ip-down

#PRODUCT_COPY_FILES += \
    #$(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    #$(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf
        
# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    ro.telephony.sends_barcount=1 \
    ro.ril.def.agps.mode=2 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=0 \
    hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.usb.setting=0 \
    persist.service.adb.enable=1 \
    persist.service.usb.hubport=4

# Telephony property for CDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4 \
    net.cdma.pppd.authtype=require-pap \
    net.cdma.datalinkinterface=/dev/ttyCDMA0 \
    net.interfaces.defaultroute=cdma \
    net.cdma.ppp.interface=ppp0 \
    ro.wimax.interface=uwbr0 \
    net.connectivity.type=CDMA1 \
    mobiledata.interfaces=ppp0,wlan0,uwbr0 \
    ro.telephony.ril_class=SamsungCDMAv6RIL \
    ro.ril.samsung_cdma=true 

$(call inherit-product-if-exists, vendor/samsung/d710/d710-vendor.mk)
