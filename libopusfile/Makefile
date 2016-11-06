#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=opusfile
PKG_VERSION:=0.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/opus/
PKG_MD5SUM:=78ad26f75900dc8428d75e6e4256196d
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libopusfile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=OPUSFile
  URL:=http://opus-codec.org/
  DEPENDS:=+libopus +libogg +libopenssl
endef

define Package/libopusfile/description
 The libopusfile package provides a convenient high-level API for decoding and basic manipulation of all Ogg Opus audio streams.
endef

ifeq ($(CONFIG_SOFT_FLOAT),y)
	CONFIGURE_ARGS+= \
		--disable-float \
		--enable-fixed-point
endif

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/opus
	$(CP) $(PKG_INSTALL_DIR)/usr/include/opus/* $(1)/usr/include/opus
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopus*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/opus*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libopusfile/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopus*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libopusfile,+libopenssl))
