#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdlquake
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_REV:=fe5b14189e1fbdf31d069cc20b2e6d3197fa0a31

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://github.com/mozzwald/sdlquake-zipit.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/sdlquake
  SECTION:=games
  CATEGORY:=Games
  TITLE:=SDL version of Quake I
  URL:=http://www.libsdl.org/projects/quake
  DEPENDS:=+libsdl
endef

define Package/sdlquake/description
	Port of ID Software's popular Quake 3-D shooter game
endef

define Package/sdlquake/install
	$(INSTALL_DIR) $(1)/usr/bin
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/sdlquake $(1)/usr/bin/
		$(INSTALL_BIN) ./files/runquake $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/games/sdlquake
		$(INSTALL_BIN) ./files/config.cfg.z2 $(1)/usr/games/sdlquake
endef

$(eval $(call BuildPackage,sdlquake))
