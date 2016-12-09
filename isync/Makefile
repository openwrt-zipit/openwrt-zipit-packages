#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=isync
PKG_VERSION:=1.2.1
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=7ba1a07c7b487a3ab5fef54d0071f1dd
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/isync
  SECTION:=mail
  CATEGORY:=Mail
  TITLE:=i(mb)sync IMAP/MailDir sync
  URL:=http://isync.sf.net
  DEPENDS:=+zlib +libsasl2 +libdb47 +libopenssl 
endef

define Package/isync/description
isync/mbsync is an IMAP MailDir syncronizer
endef

define Package/isync/install
	$(INSTALL_DIR) $(1)/usr/bin
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,isync))
