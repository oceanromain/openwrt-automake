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
echo "net.netfilter.nf_conntrack_max=165535" >> package/base-files/files/etc/sysctl.conf 
rm -rf package/lean/autocore
echo " ____  _                        _      ___                __        __    _   " > package/base-files/files/etc/banner
echo "/ ___|| |_ __ _ _ __ _ __   ___| |_   / _ \ _ __   ___ _ _\ \      / / __| |_ " >> package/base-files/files/etc/banner
echo "\___ \| __/ _\` | '__| '_ \ / _ \ __| | | | | '_ \ / _ \ '_ \ \ /\ / / '__| __|" >> package/base-files/files/etc/banner
echo " ___) | || (_| | |  | | | |  __/ |_  | |_| | |_) |  __/ | | \ V  V /| |  | |_ " >> package/base-files/files/etc/banner
echo "|____/ \__\__,_|_|  |_| |_|\___|\__|  \___/| .__/ \___|_| |_|\_/\_/ |_|   \__|" >> package/base-files/files/etc/banner
echo "                                           |_|                                " >> package/base-files/files/etc/banner
echo "------------------------------------------------------------------------------" >> package/base-files/files/etc/banner
echo "                        %D %V %C                         " >> package/base-files/files/etc/banner
echo "------------------------------------------------------------------------------" >> package/base-files/files/etc/banner

#增加设置向导
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard package/luci-app-wizard
svn co https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-beardropper package/luci-app-beardropper
svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-cowbping package/luci-app-cowbping
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule package/luci-app-rebootschedule

#修改
sed -i '7s/control/services/g' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua 
sed -i 's/R22.11.11/by Starnet 202212/g' ./package/lean/default-settings/files/zzz-default-settings

#安装
./scripts/feeds install -af
