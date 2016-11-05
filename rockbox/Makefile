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

define Build/Configure
	( cd $(PKG_BUILD_DIR); mkdir zbuild; cd zbuild; \
	../tools/configure --target=200 --lcdwidth=320 --lcdheight=240 --type=N);
#	$(call Build/Configure/Default,\
#		--target=zipit_z2)
endef

#CONFIGURE_ARGS+=--target-device=zipit-z2 --enable=decoder-opus

define Build/Compile
	( cd $(PKG_BUILD_DIR); cd zbuild; make )
endef
define Package/rockbox/install
	$(call Build/Install/Default)

	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rockbox.bin $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/share/rockbox
		$(INSTALL_BIN) $(FILES_DIR)/rockbox.sh $(1)/usr/share/rockbox

endef

$(eval $(call BuildPackage,rockbox))
