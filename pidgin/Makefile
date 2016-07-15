#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pidgin
PKG_VERSION:=2.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=7b167474db669aab2f71fa46835fb83f

PKG_INSTALL:=1
PKG_FIXUP:=libtool autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libpurple/Default
  DEPENDS:=+libxml2 +libgnutls +libopenssl +libncursesw +glib2 $(ICONV_DEPENDS) $(INTL_DEPENDS)
  URL:=http://developer.pidgin.im
endef

define Package/libpurple
  $(call Package/libpurple/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libpurple is intended to be the core of an IM program
endef

# Not sure yet why finch wants the WIDE char versions of ncurses (and panel).
define Package/finch
#  $(call Package/libpurple/Default)
  DEPENDS:=+libxml2  +libgnutls +libopenssl +libncursesw +libpurple +glib2 $(ICONV_DEPENDS) $(INTL_DEPENDS) 
  URL:=http://developer.pidgin.im

  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Instant Messaging
  TITLE:=IM client based on libpurple and ncurses
endef

define Package/libpurple/description
	libpurple is intended to be the core of an IM program. When using libpurple, you'll basically be writing a UI for this core chunk of code.
endef

define Package/finch/description
	finch is an ncurses based IM program with many plugin protocols.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--enable-shared \
		--enable-static \
		--disable-screensaver \
		--disable-sm \
		--disable-gtkspell \
		--disable-gevolution \
		--disable-nls \
		--without-x \
		--disable-gstreamer \
		--disable-vv \
		--disable-idn \
		--disable-meanwhile \
		--disable-avahi \
		--disable-dbus \
		--disable-perl \
		--with-gnutls-libs=$(STAGING_DIR)/usr/lib \
		--with-gnutls-includes=$(STAGING_DIR)/usr/include \
		--with-openssl-libs=$(STAGING_DIR)/usr/lib \
		--with-openssl-includes=$(STAGING_DIR)/usr/include/openssl \
		--with-ncurses-headers=$(STAGING_DIR)/usr/include/ncursesw \
		--disable-gtkui \
		--disable-pixmaps-install \
		--disable-doxygen \
		--disable-dot \
		--disable-tcl \
		--disable-tk \
		--disable-largefile \
		--disable-rpath \
		--disable-farstream \
		--disable-fortify \
		--without-python \
		--without-zephyr \
		--enable-gnutls=yes \
		--enable-nss=no \
		--enable-openssl=yes \
	)
endef

TARGET_LDFLAGS+=-Wl,-rpath-link=$(STAGING_DIR)/usr/lib $(INTL_LDFLAGS)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/libpurple
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/libpurple/* \
		$(1)/usr/include/libpurple

	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/lib/purple-2 $(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libpurple.{la,a,so*} \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/purple-2/* \
		$(1)/usr/lib/purple-2
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/purple.pc \
		$(1)/usr/lib/pkgconfig

	$(INSTALL_DIR) $(1)/usr/share/aclocal
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/aclocal/purple.m4 \
		$(1)/usr/share/aclocal
endef

define Package/libpurple/install
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/lib/purple-2
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libpurple.so* \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/purple-2/*.so* \
		$(1)/usr/lib/purple-2
endef

define Package/finch/install
	$(INSTALL_DIR) \
		$(1)/usr/bin \
		$(1)/usr/lib \
		$(1)/usr/lib/gnt \
		$(1)/usr/lib/finch \
		$(1)/usr/share/sounds/purple
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libgnt.so* \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gnt/*.so* \
		$(1)/usr/lib/gnt
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/gnt/*.so* \
		$(1)/usr/lib/gnt
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/finch/*.so* \
		$(1)/usr/lib/finch
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/share/sounds/purple/*.wav \
		$(1)/usr/share/sounds/purple
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/finch \
		$(1)/usr/bin

endef

$(eval $(call BuildPackage,libpurple))
$(eval $(call BuildPackage,finch))
