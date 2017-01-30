#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=respeqt
PKG_VERSION:=r3
PKG_RELEASE:=1
PKG_REV:=ec1250dc98df4ac5752f31349be3374292557d7c

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/jzatarski/RespeQt.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
-include $(STAGING_DIR)/host/mk/qmake.mk

define Package/respeqt
  SECTION:=emulators
  CATEGORY:=Emulators
  TITLE:=Atari SIO Peripheral Emulator
  URL:=https://github.com/jzatarski/RespeQt
  DEPENDS:=+qt5base-core +qt5base-gui +qt5base-network +qt5base-printSupport \
	+qt5base-plugin-platforms-linuxfb +qt5base-plugin-platforms-minimal \
	+qt5base-widgets +libstdcpp +zlib 
endef

define Package/respeqt/description
	Atari SIO Peripheral emulation via serial port. Emulates floppy, cassette and rs232.
endef

define Package/respeqt/install
	$(INSTALL_DIR) $(1)/usr/bin
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/RespeQt $(1)/usr/bin/respeqt
endef

$(eval $(call BuildPackage,respeqt))
