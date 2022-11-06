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
#修改默认IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#修改主机名
sed -i "/uci commit system/i\uci set system.@system[0].hostname='Openwrt-BY'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='Openwrt-BY'/g" ./package/base-files/files/bin/config_generate

#增加设置向导
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard package/luci-app-wizard

#安装
./scripts/feeds install -af