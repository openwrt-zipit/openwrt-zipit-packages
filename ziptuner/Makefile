#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ziptuner
PKG_VERSION:=1
PKG_REV:=1cfe50bdca803d226cdcbcb0ba8a72027b181d0d
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/ziptuner.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ziptuner
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Zippy Internet Radio Tuner
  DEPENDS:=+libcurl
endef

define Build/Compile
	( cd $(PKG_BUILD_DIR)/ && \
	$(TARGET_CC) *.c -o ziptuner
	$(TARGET_CROSS)strip $(PKG_BUILD_DIR)/ziptuner
endef

define Package/ziptuner/install
	$(INSTALL_DIR) $(1)/usr/bin 
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ziptuner $(1)/usr/bin
endef

$(eval $(call BuildPackage,ziptuner))

