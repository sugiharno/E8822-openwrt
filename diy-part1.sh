#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

sudo -E apt-get -qq install patch
patch target/linux/ramips/mt7621/base-files/etc/board.d/01_leds < ~/work/E8822-openwrt/E8822-openwrt/E8822/01_leds.E8822.patch
patch target/linux/ramips/mt7621/base-files/etc/board.d/02_network < ~/work/E8822-openwrt/E8822-openwrt/E8822/02_network.E8822.patch
patch target/linux/ramips/image/mt7621.mk < ~/work/E8822-openwrt/E8822-openwrt/E8822/mt7621.mk.E8822.patch
cp -f ~/work/E8822-openwrt/E8822-openwrt/E8822/mt7621_ZTE_E8822.dts target/linux/ramips/dts

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
