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
# Xoa wpad co ban
# 1. Tải mã nguồn luci-app-easymesh từ kho lưu trữ (Link sống 100%)
git clone https://github.com/ntlf9t/luci-app-easymesh.git package/luci-app-easymesh

# 2. Xóa các bản wpad cắt giảm (không hỗ trợ bảo mật Mesh)
sed -i 's/CONFIG_PACKAGE_wpad-basic-mbedtls=y/# CONFIG_PACKAGE_wpad-basic-mbedtls is not set/g' .config
sed -i 's/CONFIG_PACKAGE_wpad-basic=y/# CONFIG_PACKAGE_wpad-basic is not set/g' .config
sed -i 's/CONFIG_PACKAGE_wpad-mini=y/# CONFIG_PACKAGE_wpad-mini is not set/g' .config

# 3. Kích hoạt wpad xịn và gọi các lõi EasyMesh vào công thức nấu ROM
echo "CONFIG_PACKAGE_wpad-openssl=y" >> .config
echo "CONFIG_PACKAGE_ieee1905=y" >> .config
echo "CONFIG_PACKAGE_map-agent=y" >> .config
echo "CONFIG_PACKAGE_map-controller=y" >> .config
echo "CONFIG_PACKAGE_luci-app-easymesh=y" >> .config
