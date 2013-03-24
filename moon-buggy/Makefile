# Copyright (C) 2012 anarsoul@gmail.com
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=moon-buggy
PKG_VERSION:=1.0.51
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://m.seehuhn.de/programs/

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/moon-buggy
    TITLE:=Simple character graphics game where you driver some kind of car across the moon's surface
    SECTION:=games
    CATEGORY:=Games
    DEPENDS:=$(ICONV_DEPENDS) +libncurses +libncursesw
    URL:=http://www.seehuhn.de/pages/moon-buggy
endef

define Package/moon-buggy/description
	Moon-buggy is a simple character graphics game where you drive some kind of car across the moon's surface. Unfortunately there are dangerous craters there. Fortunately your car can jump over them!
endef

define Package/moon-buggy/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/gmenu2x/skins/Default/icons/ \
		$(1)/usr/share/gmenu2x/sections/games/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/moon-buggy $(1)/usr/bin/
	$(INSTALL_DATA) \
		./files/moon-buggy.gmenu \
		$(1)/usr/share/gmenu2x/sections/games/moon-buggy

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/moon-buggy.png \
		$(1)/usr/share/gmenu2x/skins/Default/icons/moon-buggy.png
endef

$(eval $(call BuildPackage,moon-buggy))
