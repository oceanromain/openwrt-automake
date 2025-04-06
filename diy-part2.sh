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
sed -i "/uci commit system/i\uci set system.@system[0].hostname='StarNet'" package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt'/g" ./package/base-files/files/bin/config_generate
#修改连接数
echo "net.netfilter.nf_conntrack_max=165535" >> package/base-files/files/etc/sysctl.conf
#sed -i '5i\uci set luci.main.mediaurlbase=/luci-static/openwrt2020' package/lean/default-settings/files/zzz-default-settings

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
#rm -rf feeds/packages/utils/watchcat
rm -rf feeds/packages/lang/golang
#rm -rf feeds/kenzo/*adguardhome*
#rm -rf feeds/luci/applications/luci-app-softether


#增加插件
#git clone https://github.com/gngpp/luci-app-wireguard-ui package/wireguard-ui
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/xiaoxiao29/luci-app-adguardhome.git package/luci-app-adguardhome
#svn co https://github.com/kenzok8/small-package/trunk/gn package/gn
#svn co https://github.com/m16-spsad/sirpdboy-package/trunk/luci-app-rebootschedule package/luci-app-rebootschedule
#svn co https://github.com/openwrt/packages/branches/openwrt-23.05/lang/golang feeds/packages/lang/golang
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netwizard package/luci-app-wizard
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-autotimeset package/luci-app-autotimeset
#svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-beardropper package/luci-app-beardropper
#svn co https://github.com/oceanromain/openwrt-packages-1/trunk/luci-app-cowbping package/luci-app-cowbping
#svn co https://github.com/openwrt/packages/branches/openwrt-23.05/lang/golang feeds/packages/lang/golang
#git clone https://github.com/oceanromain/golang.git feeds/packages/lang/golang
#svn co https://github.com/openwrt/packages/trunk/utils/watchcat feeds/packages/utils/watchcat
#git clone https://github.com/oceanromain/watchcat.git feeds/packages/utils/watchcat
#git clone https://github.com/gngpp/luci-app-watchcat-plus.git package/luci-app-watchcat-plus

git clone https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump
#git clone https://github.com/sirpdboy/chatgpt-web.git package/luci-app-chatgpt
git clone https://github.com/kenzok8/golang  feeds/packages/lang/golang

#修改
#20250125
#sed -i 's/PKG_VERSION:=5.25.0/PKG_VERSION:=5.17.0/' feeds/small/v2ray-plugin/Makefile
#sed -i 's/64d2cc376c16ade97b8e2cce69e0c98d74f530dcf8a30cf7d22255969ca5c10d/035823fa70d0c7e6afa6cced6b9d6f8b29c05a5f28852ad5954e957b61337c9e/' feeds/small/v2ray-plugin/Makefile

#20250125
#sed -i 's#\/usr\/bin\/AdGuardHome\/AdGuardHome#\/usr\/bin\/AdGuardHome#g' package/luci-app-adguardhome/root/etc/config/AdGuardHome
#sed -i '7s/control/system/g' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua 
#sed -i '7i \ \ \ \ \ \ \ \ entry({"admin", "control"}, firstchild(), "控制", 44).dependent = false' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua    
#sed -i '8d' package/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua   
#sed -i 's/R22.11.11/R22.12.1/g' ./package/lean/default-settings/files/zzz-default-settings
#chmod +x package/luci-app-rebootschedule/root/etc/init.d/rebootschedule
#chmod +x feeds/oceanweb/luci-app-oled/root/etc/init.d/oled
#20241025
#sed -i '8i \ \ \ \ \ \ \ \ entry({"admin", "control"}, firstchild(), "控制", 44).dependent = false' ./feeds/oceanweb/luci-app-autotimeset/luasrc/controller/autotimeset.lua 
#sed -i '9d' ./feeds/oceanweb/luci-app-autotimeset/luasrc/controller/autotimeset.lua 
sed -i 's/高级重启/关机/g' feeds/luci/applications/luci-app-advanced-reboot/po/zh-cn/advanced-reboot.po
chmod +x feeds/kenzo/luci-app-lucky/luci-app-lucky/root/etc/init.d/lucky 
chmod +x feeds/oceanweb/luci-app-autotimeset/root/etc/init.d/autotimeset
#chmod +x feeds/oceanweb/luci-app-beardropper/root/etc/init.d/beardropper
#chmod +x feeds/oceanweb/luci-app-cowbping/root/etc/init.d/cowbping
#sed -i 's#GO_PKG_TARGET_VARS.*# #g' feeds/packages/utils/v2dat/Makefile

#修复brook
#rm -rf feeds/small/brook/patches/*
#修复aguardhome
#rm -rf feeds/kenzo/luci-app-adguardhome/


#安装
./scripts/feeds install -af


