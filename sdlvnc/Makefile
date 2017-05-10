#
# Copyright (C) 2017 deeice
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdlvnc
PKG_VERSION:=1
PKG_REV:=7046f5c514a9adfe38f570d864f0e42da12fb7ac
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/sdlvnc.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REV)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/sdlvnc
	SECTION:=network
	CATEGORY:=Network
	TITLE:=SDL-based vnc client
	DEPENDS:=+libsdl +libsdl-gfx
endef

TARGET_CFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib 
MAKE_VARS += TARGETPATH=$(STAGING_DIR) \
	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

define Package/sdlvnc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sdlvnc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sdlvnc))
