#
# Copyright (C) 2016 github.com/openwrt-zipit
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=retawq
PKG_VERSION:=0.2.6c
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=ee60188bea597680bd39e435a8c73ff9

include $(INCLUDE_DIR)/package.mk

define Package/retawq
    TITLE:=retawq text browser
    SUBMENU:=Web
    SECTION:=network
    CATEGORY:=Network
    URL:=http://retawq.sourceforge.net/
    DEPENDS:=+libncurses +libopenssl
endef

define Package/retawq/description
    retawq is an interactive, multi-threaded network client (web browser) for text terminals
endef

TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib 

define Build/Configure
	( cd $(PKG_BUILD_DIR) && \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		CC="$(TARGET_CC)" \
		./configure \
			--path-prefix=/usr \
			--set-tg=ncurses \
			--set-tls=2 \
			--set-execext=1 \
			--set-threading=1 )
endef

define Package/retawq/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/retawq $(1)/usr/bin/
endef

$(eval $(call BuildPackage,retawq))
