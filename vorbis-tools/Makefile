#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vorbis-tools
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/vorbis/
PKG_MD5SUM:=567e0fb8d321b2cd7124f8208b8b90e6

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vorbis-tools
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libogg +libvorbisidec libspeex +libopus +libopusfile +libao +libcurl
  TITLE:=VORBIS Codec tools
  URL:=http://xiph.org/
endef

define Package/vorbis-tools/description
 This package provides command-line utilities to encode, inspect, and decode 
 ogg vorbis and opus files.
endef

CONFIGURE_ARGS += \
	--disable-oggdec \
	--disable-oggenc \
	--disable-ogginfo \
	--disable-vcut \
	--disable-vorbiscomment \
	--disable-oggtest \
	--disable-vorbistest \
	--disable-curltest \
	--without-speex \
	--without-flac


define Package/vorbis-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ogg123 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,vorbis-tools))
