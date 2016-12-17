#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=handy
PKG_VERSION:=0.95
PKG_RELEASE:=1
PKG_REV:=2e01813a6cfc0b5d72893a2f7252e77430382bd1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/mozzwald/handy-sdl.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/handy
  SECTION:=emulators
  CATEGORY:=Emulators
  TITLE:=SDL Atari Lynx Emulator
  URL:=http://handy.sourceforge.net/
  DEPENDS:=+libstdcpp +libsdl
endef

define Package/handy/description
	SDL Atari Lynx emulator
endef

define Build/Configure
	$(CP) $(PKG_BUILD_DIR)/Makefile.zipit $(PKG_BUILD_DIR)/Makefile
endef

define Package/handy/install
	$(INSTALL_DIR) $(1)/usr/games/handy
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/handy-sdl $(1)/usr/games/handy/
# Atari Lynx Boot ROM available from https://atariage.com/Lynx/emulation/index.html
#		$(INSTALL_DATA) ./files/lynxboot.img $(1)/usr/games/handy/
	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) ./files/handy.sh $(1)/usr/bin/handy
endef

$(eval $(call BuildPackage,handy))