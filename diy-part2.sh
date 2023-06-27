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
sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-StarNet'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrtStarNet'/g" ./package/base-files/files/bin/config_generate
#修改连接数
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

#删除watchcat
rm -rf feeds/packages/utils/watchcat
#rm -rf feeds/packages/lang/golang


#增加设置向导
svn export https://github.com/gngpp/openwrt_packages_lang_golang/branches/master feeds/packages/lang/golang
#git clone https://github.com/gngpp/luci-app-wireguard-ui package/wireguard-ui
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netwizard package/luci-app-wizard
svn co https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-beardropper package/luci-app-beardropper
svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-cowbping package/luci-app-cowbping
svn co https://github.com/m16-spsad/sirpdboy-package/trunk/luci-app-rebootschedule package/luci-app-rebootschedule
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/adguardhome package/luci-app-adguardhome
svn co https://github.com/kenzok8/small-package/trunk/gn package/gn
git clone https://github.com/sirpdboy/chatgpt-web.git package/luci-app-chatgpt
svn co https://github.com/openwrt/packages/trunk/utils/watchcat feeds/packages/utils/watchcat
git clone https://github.com/gngpp/luci-app-watchcat-plus.git package/luci-app-watchcat-plus


#修改
#sed -i '7s/control/system/g' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua 
sed -i '7i \ \ \ \ \ \ \ \ entry({"admin", "control"}, firstchild(), "控制", 44).dependent = false' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua    
sed -i '8d' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua    
sed -i 's/R22.11.11/R22.12.1/g' ./package/lean/default-settings/files/zzz-default-settings
chmod +x package/luci-app-rebootschedule/root/etc/init.d/rebootschedule
chmod +x feeds/kenzo/luci-app-lucky/luci-app-lucky/root/etc/init.d/lucky 
chmod +x package/luci-app-autotimeset/root/etc/init.d/autotimeset

#修复brook
#rm -rf feeds/small/brook/patches/010-chore-deps-update-iploc-to-fix-build-with-mips.patch
#修复aguardhome
rm -rf feeds/kenzo/adguardhome/


#安装
./scripts/feeds install -af


