# Copyright (C) 2008 openwrt-zipit
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sz81
PKG_VERSION:=2.1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-source.tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=e0ec83d076793e6275dd58d22139eabe

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sz81
  TITLE:=ZX Spectrum Emulator
  SECTION:=emulators
  CATEGORY:=Emulators
  URL:=https://sourceforge.net/projects/sz81/
  DEPENDS:=+libsdl
endef

define Package/sz81/description
  A Sinclair ZX80/ZX81 emulator employing the highly portable SDL and including additional 
functionality and features for desktop computers and portable devices
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lm

define Package/sz81/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/sz81/ \

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/sz81 \
		$(1)/usr/bin/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/data/* \
		$(PKG_BUILD_DIR)/README \
		$(1)/usr/share/sz81/

endef

define Package/sz81-demos
  TITLE:=sz81 Emulator Demo Programs
  SECTION:=emulators
  CATEGORY:=Emulators
  URL:=https://sourceforge.net/projects/sz81/
  DEPENDS:=+sz81
endef

define Package/sz81-demos/install
	$(INSTALL_DIR) $(1)/usr/share/sz81/demos

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/games-etc/*.p \
		$(1)/usr/share/sz81/demos
endef

$(eval $(call BuildPackage,sz81))
$(eval $(call BuildPackage,sz81-demos))
