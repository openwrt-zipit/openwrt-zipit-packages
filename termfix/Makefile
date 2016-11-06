#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=termfix
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/termfix
  SECTION:utilities
  CATEGORY:=Utilities
  TITLE:=Unlock terminal after a program crash
  DEPENDS:=
endef

define Build/Prepare
	$(CP) $(FILES_DIR)/termfix.c $(PKG_BUILD_DIR)
endef

define Build/Configure

endef

define Build/Compile
	( cd $(PKG_BUILD_DIR) && \
	$(TARGET_CC) termfix.c -o termfix )
endef

define Package/termfix/install
	$(INSTALL_DIR) \
		$(1)/usr/bin 
	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/termfix $(1)/usr/bin
endef

$(eval $(call BuildPackage,termfix))

