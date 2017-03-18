#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ziptuner
PKG_VERSION:=1
PKG_REV:=993bd10bb42ec2be3a0838e92a728f5cbc4e855b
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/ziptuner.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REV)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/ziptuner
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Zippy Internet Radio Tuner
  DEPENDS:=+libcurl +dialog
endef

define Build/Compile
	( cd $(PKG_BUILD_DIR)/ && \
		CFLAGS="$(TARGET_CFLAGS)" \
		$(TARGET_CC) -Os *.c -o ziptuner -lcurl && \
		$(TARGET_CROSS)strip $(PKG_BUILD_DIR)/ziptuner )
endef

define Package/ziptuner/install
	$(INSTALL_DIR) $(1)/usr/bin 
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ziptuner $(1)/usr/bin/ziptuner.bin
	$(INSTALL_BIN) ./files/ziptuner.sh $(1)/usr/bin/ziptuner

	$(INSTALL_DIR) $(1)/usr/share/ziptuner
	$(INSTALL_DATA) ./files/dialogrc.soho $(1)/usr/share/ziptuner/
	$(INSTALL_DATA) ./files/onPlay $(1)/usr/share/ziptuner/

	$(INSTALL_DIR) $(1)/usr/local/bin 
	$(INSTALL_DATA) ./files/mplayertty4 $(1)/usr/local/bin/
endef

$(eval $(call BuildPackage,ziptuner))
