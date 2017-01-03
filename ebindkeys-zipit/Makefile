#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ebindkeys-zipit
#PKG_VERSION:=2016.06.02
PKG_VERSION:=ca038a8dee499ea830c2f2d1f09e4ce836165015
PKG_RELEASE:=2
PKG_REV:=bldaemon

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
#PKG_SOURCE_URL:=git://github.com/mozzwald/ebindkeys-zipit.git
PKG_SOURCE_URL:=git://github.com/deeice/ebindkeys-zipit.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ebindkeys-zipit
  SECTION:=utilities
  CATEGORY:=Utilities
  TITLE:=bind a key or key combo to a command
  DEPENDS:=+kmod-input-uinput +kmod-input-evdev +libpthread
  URL:=http://home.vay8.net/doku.php?id=ebindkeys-zipit
endef

define Package/ebindkeys-zipit/description
	ebindkeys-zipit lets you bind a key or key-combo to a command, now with keymouse and bldaemon
endef

#define Build/Compile
#	$(TARGET_CC) -s -Os -o $(PKG_BUILD_DIR)/sendtty $(PKG_BUILD_DIR)/sendtty.c
#endef

define Package/ebindkeys-zipit/install
	$(CP) ./files/sendtty.c $(PKG_BUILD_DIR)/
		$(TARGET_CC) -s -Os -o $(PKG_BUILD_DIR)/sendtty $(PKG_BUILD_DIR)/sendtty.c
	$(INSTALL_DIR) $(1)/usr/local/bin
		$(INSTALL_BIN) ./files/onStop $(1)/usr/local/bin/onStop
		$(INSTALL_BIN) ./files/onPlay $(1)/usr/local/bin/onPlay
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/sendtty $(1)/usr/local/bin/sendtty
	$(INSTALL_DIR) $(1)/usr/sbin
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/ebindkeys $(1)/usr/sbin/
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/ebkfork $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/local/sbin
#		$(INSTALL_BIN) ./files/onAltTab $(1)/usr/local/sbin/onAltTab
#		$(LN) /usr/local/sbin/onAltTab $(1)/usr/local/sbin/onShftAltTab
		$(INSTALL_BIN) ./files/onPowerDown $(1)/usr/local/sbin/onPowerDown
	$(INSTALL_DIR) $(1)/usr/share/ebindkeys
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/ebindkeysrc.sample $(1)/usr/share/ebindkeys/
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/zipit-keys $(1)/usr/share/ebindkeys/
		$(INSTALL_DATA) $(PKG_BUILD_DIR)/README $(1)/usr/share/ebindkeys/
	$(INSTALL_DIR) $(1)/etc
		$(INSTALL_DATA) ./files/ebindkeysrc $(1)/etc/ebindkeysrc
endef

$(eval $(call BuildPackage,ebindkeys-zipit))
