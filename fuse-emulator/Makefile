# Copyright (C) 2008 openwrt-zipit
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fuse-emulator
PKG_VERSION:=1.3.3
PKG_RELEASE:=1

PKG_SOURCE:=fuse-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/fuse-emulator
PKG_MD5SUM:=e50e16099d84ffe71860a9a1aceeadae

PKG_BUILD_DIR:=$(BUILD_DIR)/fuse-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fuse-emulator
  TITLE:=ZX Spectrum Emulator
  SECTION:=emulators
  CATEGORY:=Emulators
  URL:=http://fuse-emulator.sourceforge.net/libspectrum.php
  DEPENDS:=+libspectrum +libsdl +libpng +libxml2
endef

define Package/fuse-emulator/description
  Fuse (Free Unix Spectrum Emulator) is a ZX Spectrum Emulator
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--host=arm-openwrt-linux \
		--prefix=/usr/local \
		--exec-prefix=/usr/local \
		--with-sdl \
		--with-sdl-prefix="$(STAGING_DIR)/usr" \
	)
endef

define Package/fuse-emulator/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/fuse

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/fuse \
		$(1)/usr/bin

	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/fuse/* \
		$(1)/usr/share/fuse/
endef

$(eval $(call BuildPackage,fuse-emulator))