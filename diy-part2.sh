#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 设置密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings    

# Set DISTRIB_REVISION
sed -i "s/OpenWrt_x86_64 /Build $(TZ=UTC-8 date "+%Y.%m.%d") Compiled by Drixn /g" package/lean/default-settings/files/zzz-default-settings

# Modify default IP（FROM 192.168.1.1 CHANGE TO 10.10.10.2）
echo '自定义 LAN 口 IP...'
sed -i 's/192.168.1.1/10.10.10.2/g' package/base-files/files/bin/config_generate

# Modify system hostname（FROM OpenWrt CHANGE TO OpenWrt-x86_64）
sed -i 's/OpenWrt/OpenWrt-x86_64/g' package/base-files/files/bin/config_generate
