#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=stppc
PKG_VERSION:=2.1
PKG_REV:=f42cd8e5834bff8ea782d334582cd3b6237ee39b
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/stppc.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=sparsehash

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/SDL \
	-ffast-math

#TARGET_CPPFLAGS+= \
#  -I$(STAGING_DIR)/usr/include/SDL \
#  -I$(STAGING_DIR)/usr/include/google/sparsehash \
#  -I$(PKG_BUILD_DIR)/src/tinyxml \
#  -DLOG_LEVEL=0

MAKE_VARS += \
	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

#MAKE_FLAGS += linux
MAKE_FLAGS += -C $(PKG_BUILD_DIR)/src

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/SDL \
	-Wl,--gc-sections

define Package/stppc
  TITLE:=stppc
  SECTION:=games
  CATEGORY:=Games
  URL:=http://www.chiark.greenend.org.uk/~sgtatham/puzzles/
  DEPENDS:=+libsdl +libsdl-image +libsdl-ttf +libsdl-gfx +libsdl-mixer
endef

define Package/stppc/description
	Simon Tathams Portable Puzzle Collection
endef

#define Build/Configure
#	( cd $(PKG_BUILD_DIR); ./autogen.sh );
#	$(call Build/Configure/Default,\
#		--enable-platform=zipitz2)
#endef

#define Build/Compile
#	( cd $(PKG_BUILD_DIR) );
#	$(call Build/Compile/Default, -C $(PKG_BUILD_DIR)/src )
#endef

define Package/stppc/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/stppc/ \

	$(INSTALL_BIN) \
		$(FILES_DIR)/stppc \
		$(1)/usr/bin/stppc

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/src/stppc2x \
		$(1)/usr/share/stppc/

	$(CP) $(PKG_BUILD_DIR)/stppc/* $(1)/usr/share/stppc/
endef

$(eval $(call BuildPackage,stppc))
