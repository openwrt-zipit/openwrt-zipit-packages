#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=navit
PKG_VERSION:=0.5.0
PKG_RELEASE:=1
#PKG_FIXUP:=autoreconf

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/navit-gps/navit/archive/v$(PKG_VERSION)/
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=gpsd

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/navit
  TITLE:=navit
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.navit-project.org/
#  DEPENDS:=+libsdl +libsdl-image +glib2 +libintl +libiconv +zlib +libfreetype +libfontconfig +libcrypto +libpthread +fontconfig
  DEPENDS:=$(ICONV_DEPENDS) $(INTL_DEPENDS) +glib2 +libsdl +libsdl-image +zlib +fontconfig +libfreetype +libpthread +libopenssl +liberation-fonts-ttf
endef

define Package/navit/description
	Car navigation system with routing engine
endef

MAKE_VARS += \
	SDLCONFIG=$(STAGING_DIR)/host/bin/sdl-config

#MAKE_FLAGS += -f Makefile.zipit

TARGET_CFLAGS+= \
	$(ICONV_CFLAGS) \
	$(INTL_CFLAGS)

#TARGET_LDFLAGS+= \
#	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
#	$(ICONV_LDFLAGS) -liconv \
#	$(INTL_LDLAGS) -lintl

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(ICONV_LDFLAGS) \
	$(INTL_LDLAGS)

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh );
	$(call Build/Configure/Default,\
		--disable-graphics-gtk-drawing-area \
		--disable-gui-gtk \
		--disable-graphics-qt-qpainter \
		--disable-binding-dbus \
		--disable-fontconfig \
		--disable-fribidi \
		--enable-cache-size=8388608 \
		--disable-vehicle-gpsd \
		--disable-binding-python \
		--enable-avoid-float \
		--enable-avoid-unaligned \
		--disable-svg)
#		--with-freetype-fonts=dejavu-xyz...or something
endef

define Package/navit/install
	$(call Build/Install/Default)

	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/navit $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/maptool $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/navit/font
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/font/*.so $(1)/usr/lib/navit/font/
	$(INSTALL_DIR) $(1)/usr/lib/navit/graphics
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/graphics/*.so $(1)/usr/lib/navit/graphics/
	$(INSTALL_DIR) $(1)/usr/lib/navit/gui
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/gui/*.so $(1)/usr/lib/navit/gui/
	$(INSTALL_DIR) $(1)/usr/lib/navit/map
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/map/*.so $(1)/usr/lib/navit/map/
	$(INSTALL_DIR) $(1)/usr/lib/navit/osd
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/osd/*.so $(1)/usr/lib/navit/osd/
	$(INSTALL_DIR) $(1)/usr/lib/navit/speech
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/speech/*.so $(1)/usr/lib/navit/speech/
	$(INSTALL_DIR) $(1)/usr/lib/navit/vehicle
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/navit/vehicle/*.so $(1)/usr/lib/navit/vehicle/

	$(INSTALL_DIR) $(1)/root/.navit
		$(INSTALL_DATA) $(FILES_DIR)/navit.zipit.xml $(1)/root/.navit/navit.xml
	$(INSTALL_DIR) $(1)/usr/share/navit
		$(INSTALL_BIN) $(FILES_DIR)/navit.sh $(1)/usr/share/navit/
#		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/navit/navit.xml $(1)/usr/share/navit/
		$(INSTALL_DATA) $(FILES_DIR)/navit.zipit.xml $(1)/usr/share/navit/
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/navit/README $(1)/usr/share/navit/
	$(INSTALL_DIR) $(1)/usr/share/navit/xpm
		$(CP) $(PKG_INSTALL_DIR)/usr/share/navit/xpm/* $(1)/usr/share/navit/xpm/
		$(CP) $(FILES_DIR)/navit*.png $(1)/usr/share/navit/xpm/
	$(INSTALL_DIR) $(1)/usr/share/navit/maps
		$(CP) $(FILES_DIR)/osm_bbox* $(1)/usr/share/navit/maps/
	$(INSTALL_DIR) $(1)/usr/share/navit/fonts
		$(LN) -s /usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf \
			$(1)/usr/share/navit/fonts/LiberationSans-Regular.ttf
		$(LN) -s /usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf \
			$(1)/usr/share/navit/fonts/LiberationSans-Bold.ttf
endef

$(eval $(call BuildPackage,navit,+libopenssl,+fontconfig))
