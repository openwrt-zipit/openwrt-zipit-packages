#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dinguxcommander
PKG_VERSION:=2.1
PKG_REV:=b4e0f41a261e4f26d2fbfb786082bbcbf08e052a
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/DinguxCommander.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=sparsehash

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS+= \
	-I$(STAGING_DIR)/usr/include/SDL \
	-I$(STAGING_DIR)/usr/include/google/sparsehash \
	-I$(PKG_BUILD_DIR)/src/tinyxml \
	-DTIXML_USE_STL -msoft-float -fomit-frame-pointer \
	-ffast-math -Wall -Wno-unknown-pragmas -Wno-format \
	-pipe -g -fno-exceptions -fno-rtti -Os -fdata-sections -ffunction-sections

TARGET_CPPFLAGS+= \
  -I$(STAGING_DIR)/usr/include/SDL \
  -I$(STAGING_DIR)/usr/include/google/sparsehash \
  -I$(PKG_BUILD_DIR)/src/tinyxml \
  -DLOG_LEVEL=0

MAKE_VARS += \
	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

#MAKE_FLAGS += linux
MAKE_FLAGS += -f Makefile.zipit

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-L$(STAGING_DIR)/usr/lib/SDL \
	-Wl,--gc-sections

define Package/dinguxcommander
  TITLE:=dinguxcommander
  CATEGORY:=Utilities
  SECTION:=utils
  URL:=http://boards.dingoonity.org/dingux-releases/dinguxcommander/
  DEPENDS:=+libsdl +libsdl-image +libsdl-ttf +libstdcpp
endef

define Package/dinguxcommander/description
	Two-pane file manager in the style of Norton Commander
endef

#define Build/Configure
#	( cd $(PKG_BUILD_DIR); ./autogen.sh );
#	$(call Build/Configure/Default,\
#		--enable-platform=zipitz2)
#endef

#define Build/Compile
#	$(call Build/Compile/Default, linux)
#endef

define Package/dinguxcommander/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/dinguxcommander/res/ \

	$(INSTALL_BIN) \
		$(FILES_DIR)/dinguxcommander \
		$(1)/usr/bin/dinguxcommander

#	$(INSTALL_BIN) \
#		$(PKG_INSTALL_DIR)/usr/bin/dinguxcommander \
#		$(1)/usr/share/dinguxcommander

	$(CP) $(PKG_BUILD_DIR)/output/zipit/DinguxCommander \
		$(1)/usr/share/dinguxcommander/dinguxcommander.bin

	$(CP) $(PKG_BUILD_DIR)/res/*.png $(1)/usr/share/dinguxcommander/res/

	$(CP) $(PKG_BUILD_DIR)/res/Fiery_Turk.ttf $(1)/usr/share/dinguxcommander/res/font.ttf
endef

$(eval $(call BuildPackage,dinguxcommander))
