# 
# Copyright (c) 2010 wejp
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmu
PKG_VERSION:=0.10.1
PKG_RELEASE:=4

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://wejp.k.vu/files/
PKG_MD5SUM:=98146012ce9b5e8971162796a0be17e3

include $(INCLUDE_DIR)/package.mk

define Package/gmu
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Gmu Music Player
  URL:=http://wejp.k.vu/projects/gmu/
  MENU:=1
  DEPENDS:=+libsdl +libsdl-image +libsdl-gfx +libmpcdec +libmikmod \
	+libvorbisidec +libspeex +libflac +libogg +libncurses \
	+libncursesw +BUILD_PATENTED:libmpg123 +libopus +libopusfile
endef

define Package/gmu/description
  A popular music player for various handheld devices.
  It supports various file formats and comes with a
  file browser and a playlist editor/viewer.
endef

#MAKE_VARS += \
#	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

#MAKE_FLAGS += -f Makefile.zipit

#TARGET_CFLAGS+= \
#	$(ICONV_CFLAGS) \
#	$(INTL_CFLAGS)

TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include/opus

#TARGET_LDFLAGS+= \
#	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
#	$(ICONV_LDFLAGS) -liconv \
#	$(INTL_LDLAGS) -lintl

CONFIGURE_ARGS+=--target-device=zipit-z2 --enable=decoder-opus

define Package/gmu/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/share/gmu \
		$(1)/usr/share/gmu/themes/default-modern \
		$(1)/usr/share/gmu/themes/default-modern-large \
		$(1)/usr/share/gmu/themes/dbcompo \
		$(1)/usr/share/gmu/themes/dbcompo-small \
		$(1)/usr/share/gmu/frontends \
		$(1)/usr/share/gmu/decoders \
		$(1)/usr/share/gmu/htdocs \
		$(1)/root/.config/gmu \
		$(1)/root/.local/share/gmu

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/gmuc \
		$(1)/usr/bin/gmuc

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/gmu.bin \
		$(1)/usr/bin/gmu.bin

	$(INSTALL_BIN) \
		./files/zipitz2/gmu.sh \
		$(1)/usr/bin/gmu

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/frontends/* \
		$(1)/usr/share/gmu/frontends/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/decoders/* \
		$(1)/usr/share/gmu/decoders/

	$(INSTALL_DATA) \
		./files/zipitz2/gmuinput.conf \
		$(1)/root/.config/gmu/

	$(INSTALL_DATA) \
		./files/zipitz2/default.keymap \
		$(1)/root/.config/gmu/

	$(INSTALL_DATA) \
		./files/zipitz2/gmu.conf \
		$(1)/root/.config/gmu/

	$(INSTALL_DATA) \
		./files/zipitz2/playlist.m3u \
		$(1)/root/.local/share/gmu/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/themes/default-modern/* \
		$(1)/usr/share/gmu/themes/default-modern/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/themes/default-modern-large/* \
		$(1)/usr/share/gmu/themes/default-modern-large/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/themes/dbcompo/* \
		$(1)/usr/share/gmu/themes/dbcompo/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/themes/dbcompo-small/* \
		$(1)/usr/share/gmu/themes/dbcompo-small/

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/htdocs/* \
		$(1)/usr/share/gmu/htdocs/

#	$(INSTALL_DATA) \
#		$(PKG_BUILD_DIR)/README.txt \
#		$(1)/usr/share/gmu/
endef

$(eval $(call BuildPackage,gmu))
