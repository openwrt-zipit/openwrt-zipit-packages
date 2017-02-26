# Copyright (C) 2008 openwrt-zipit
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libspectrum
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/fuse-emulator
PKG_MD5SUM:=754bed21df191ca01d4aca66eda04526

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libspectrum
  TITLE:=ZX Spectrum Emulator Lib
  SECTION:=emulators
  CATEGORY:=Emulators
  URL:=http://fuse-emulator.sourceforge.net/libspectrum.php
  DEPENDS:=+zlib +libbz2 $(INTL_DEPENDS)
endef

define Package/libspectrum/description
  A library designed to make the input and output of some ZX Spectrum emulator files slightly easier
endef

TARGET_CFLAGS+= \
	$(INTL_CFLAGS)

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(INTL_LDFLAGS)

define Build/Configure
	$(call Build/Configure/Default, \
		--host=arm-openwrt-linux \
		--prefix=/usr/local \
		--exec-prefix=/usr/local \
		--with-fake-glib \
		--without-libgcrypt \
		--without-libaudiofile)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/local/include/libspectrum.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) -a \
		$(PKG_INSTALL_DIR)/usr/local/lib/* \
		$(1)/usr/lib/
endef
	
define Package/libspectrum/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/local/lib/libspectrum.so.8.4.5 \
		$(1)/usr/lib

	$(LN) -s \
		libspectrum.so.8.4.5 \
		$(1)/usr/lib/libspectrum.so

	$(LN) -s \
		libspectrum.so.8.4.5 \
		$(1)/usr/lib/libspectrum.so.8
endef

$(eval $(call BuildPackage,libspectrum))