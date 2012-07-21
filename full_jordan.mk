# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/moto/mb525/jordan.mk)
$(call inherit-product, vendor/motorola/jordan/jordan-vendor.mk)
# recovery tools


#PRODUCT_COPY_FILES += \
##	out/target/product/jordan/recovery/root/sbin/tune2fs:system/bootmenu/recovery/sbin/tune2fs \
#	out/target/product/jordan/recovery/root/sbin/e2fsck:system/bootmenu/recovery/sbin/e2fsck \
#	out/target/product/jordan/recovery/root/sbin/tune2fs:system/bootmenu/recovery/sbin/tune2fs \
#	out/target/product/jordan/recovery/root/sbin/mke2fs:system/bootmenu/recovery/sbin/mke2fs.bin \
#	out/target/product/jordan/recovery/root/sbin/pigz:system/bootmenu/recovery/sbin/pigz \

# copy all vendor (motorola) kernel modules to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d vendor/motorola/jordan/lib/modules &&  \
	find vendor/motorola/jordan/lib/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

PRODUCT_NAME := full_jordan
PRODUCT_DEVICE := jordan
PRODUCT_BRAND := Android
PRODUCT_MODEL := MB525
PRODUCT_MANUFACTURER := motorola
