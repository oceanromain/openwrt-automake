#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git opentopd  https://github.com/sirpdboy/sirpdboy-package' >>feeds.conf.default
#echo 'src-git oceanr https://github.com/oceanromain/openwrt-packages.git' >>feeds.conf.default
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git nas https://github.com/linkease/nas-packages.git' >>feeds.conf.default

echo 'src-git small https://github.com/kenzok8/small.git' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages.git' >>feeds.conf.default
#echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >>feeds.conf.default
#echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >>feeds.conf.default
#echo 'src-git ddns_go https://github.com/sirpdboy/luci-app-ddns-go' >>feeds.conf.default
#echo 'src-git autocore https://github.com/oceanromain/myautocore package/myautocore' >>feeds.conf.default
echo 'src-git oceanweb https://github.com/oceanromain/my-openwrt-package.git' >>feeds.conf.default
echo "src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main" >> "feeds.conf.default"
#echo 'src-git small_all https://github.com/kenzok8/small-package.git' >> feeds.conf.default
#20241025
#echo 'src-git small_all https://github.com/kenzok8/small-package.git' >> feeds.conf.default
#echo 'src-git nxx https://github.com/NueXini/NueXini_Packages.git' >> feeds.conf.default