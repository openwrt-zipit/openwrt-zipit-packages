#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rockbox
PKG_VERSION:=20161101
PKG_REV:=d492f25c54b4134fd6632156efee07670ab4004f
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_SOURCE_URL:=git://git.rockbox.org/rockbox.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/rockbox
  TITLE:=Rockbox Music Player
  SECTION:=multimedia
  CATEGORY:=Multimedia
  URL:=http://www.rockbox.org/
  DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +libsdl +libpthread
endef

define Package/rockbox/description
	Music player with many codecs and plugins.
endef

MAKE_VARS += \
	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

#MAKE_FLAGS += -f Makefile.zipit

TARGET_CFLAGS+= \
	$(ICONV_CFLAGS) \
	$(INTL_CFLAGS)

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(ICONV_LDFLAGS) -liconv \
	$(INTL_LDLAGS) -lintl

# I think this is the way to go, but I need to define zipitcc settings in ../tools/configure
# or maybe pass TARGET_CC etc to configure (instead of CC, CPP.. as seen below)
define Build/Configure
	( cd $(PKG_BUILD_DIR); mkdir zbuild; cd zbuild; \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	../tools/configure --target=209 --lcdwidth=320 --lcdheight=240 --type=N )
endef

#define Build/Configure
#	( cd $(PKG_BUILD_DIR); mkdir zbuild; cd zbuild; \
#		CC="$(TARGET_CROSS)gcc" \
#		CPP="$(TARGET_CROSS)cpp" \
#		AR="$(TARGET_CROSS)ar cqs" \
#		LD="$(TARGET_CROSS)g++" \
#		AS="$(TARGET_CROSS)as" \
#		OC="$(TARGET_CROSS)objcopy" \
#		RANLIB="$(TARGET_CROSS)ranlib" \
#		SHARED_LDFLAG="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" \
#		../tools/configure --target=209 --lcdwidth=320 --lcdheight=240 --type=N --compiler-prefix=$(TARGET_CROSS));
##	$(call Build/Configure/Default,\
##		--target=zipit_z2)
#endef

#CONFIGURE_ARGS+=--target-device=zipit-z2 --enable=decoder-opus

#define Build/Compile
#endef

# Lets start with just the tools.
define Build/Compile
#	( cd $(PKG_BUILD_DIR); cd zbuild; $(MAKE) tools ) # tools only
	( cd $(PKG_BUILD_DIR); cd zbuild; make )
endef

define Package/rockbox/install
#	$(call Build/Install/Default)
	( cd $(PKG_BUILD_DIR); cd zbuild; make install )

	$(INSTALL_DIR) $(1)/usr/local/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/rockbox.bin $(1)/usr/local/bin/
		$(INSTALL_BIN) $(FILES_DIR)/rockbox.sh $(1)/usr/local/share/rockbox/rockbox

	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/codecs
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/codecs/* $(1)/usr/local/lib/rockbox/codecs

	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/rocks/apps
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/apps/* $(1)/usr/local/lib/rockbox/rocks/apps/
	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/rocks/demos
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/demos/* $(1)/usr/local/lib/rockbox/rocks/demos/
	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/rocks/games
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/games/* $(1)/usr/local/lib/rockbox/rocks/games/
	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/rocks/viewers
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/viewers/*.rock $(1)/usr/local/lib/rockbox/rocks/viewers/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/viewers/*.ovl $(1)/usr/local/lib/rockbox/rocks/viewers/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/viewers/*.config $(1)/usr/local/lib/rockbox/rocks/viewers/
	$(INSTALL_DIR) $(1)/usr/local/lib/rockbox/rocks/viewers/lua
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/rockbox/rocks/viewers/lua/* $(1)/usr/local/lib/rockbox/rocks/viewers/lua/

	$(INSTALL_DIR) $(1)/usr/local/share/rockbox
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/*.config $(1)/usr/local/share/rockbox/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/*.txt $(1)/usr/local/share/rockbox/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/*.ignore $(1)/usr/local/share/rockbox/
		$(INSTALL_BIN) $(FILES_DIR)/rockbox.sh $(1)/usr/local/share/rockbox/

	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/backdrops
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/backdrops/* $(1)/usr/local/share/rockbox/backdrops/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/codepages
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/codepages/* $(1)/usr/local/share/rockbox/codepages/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/docs
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/docs/* $(1)/usr/local/share/rockbox/docs/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/eqs
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/eqs/* $(1)/usr/local/share/rockbox/eqs/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/fonts
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/fonts/* $(1)/usr/local/share/rockbox/fonts/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/icons
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/icons/* $(1)/usr/local/share/rockbox/icons/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/langs
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/langs/* $(1)/usr/local/share/rockbox/langs/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/themes
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/themes/* $(1)/usr/local/share/rockbox/themes/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/wps
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/wps/*.* $(1)/usr/local/share/rockbox/wps/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/wps/cabbiev2
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/wps/cabbiev2/* $(1)/usr/local/share/rockbox/wps/cabbiev2/
	$(INSTALL_DIR) $(1)/usr/local/share/rockbox/wps/classic_statusbar
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/share/rockbox/wps/classic_statusbar/* $(1)/usr/local/share/rockbox/wps/classic_statusbar/

endef

$(eval $(call BuildPackage,rockbox))
