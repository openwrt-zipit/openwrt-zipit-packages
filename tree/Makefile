#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tree
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=http://mama.indstate.edu/users/ice/tree/src/
#PKG_MD5SUM:=935aebcbe610fbc9de8125e7b7d71297

include $(INCLUDE_DIR)/package.mk

define Package/tree
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Recursive directory listing
  URL:=http://mama.indstate.edu/users/ice/tree
endef

define Package/tree/description
	Tree is a recursive directory listing command that produces a depth indented listing of files.
endef

define Package/tree/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tree $(1)/usr/bin/
endef

$(eval $(call BuildPackage,tree))
