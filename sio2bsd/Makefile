#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sio2bsd
PKG_VERSION:=1.19
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-2015-09-05.tar.gz
PKG_SOURCE_URL:=http://drac030.krap.pl
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

#PKG_INSTALL:=1

define Package/sio2bsd
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Atari SIO2PC Interface
  URL:=http://drac030.krap.pl
endef

define Package/sio2bsd/description
	Atari SIO2PC Interface via Serial/UART Port
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	tar xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
	$(CP) ./files/Makefile $(PKG_BUILD_DIR)/Makefile
endef

define Build/Compile
	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		$(MAKE_FLAGS)
endef

define Package/sio2bsd/install
	$(INSTALL_DIR) $(1)/usr/bin
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/sio2bsd $(1)/usr/bin
		$(LN) -s /usr/bin/sio2bsd $(1)/usr/bin/mkatr
endef

$(eval $(call BuildPackage,sio2bsd))