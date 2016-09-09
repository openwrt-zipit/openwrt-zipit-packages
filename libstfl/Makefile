# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libstfl
PKG_VERSION:=0.24

PKG_SOURCE:=stfl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.clifford.at/stfl/

PKG_BUILD_DIR:=$(BUILD_DIR)/stfl-$(PKG_VERSION)/
PKG_RELEASE:=1

#PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/libstfl
	SECTION:=libraries
	CATEGORY:=Libraries
	TITLE:=libstfl
	URL:=http://www.clifford.at/stfl
	DEPENDS:= +libncursesw $(ICONV_DEPENDS)
endef

define Package/libstfl/description
  STFL is a library which implements a curses-based
  widget set for text terminals
endef

CONFIGURE_ARGS+=

TARGET_CFLAGS+= $(ICONV_CFLAGS) \
	-I$(STAGING_DIR)/usr/include/ncursesw

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(ICONV_LDFLAGS) -liconv \
	$(shell $(STAGING_DIR)/usr/bin/ncurses5-config --cflags --libs)

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/stfl.h \
		$(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libstfl.so.$(PKG_VERSION) \
		$(1)/usr/lib/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/libstfl.a \
		$(1)/usr/lib/
	$(LN) libstfl.so.$(PKG_VERSION) $(1)/usr/lib/libstfl.so

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/stfl.pc \
		$(1)/usr/lib/pkgconfig/
endef

define Package/libstfl/install
	$(call Build/Install/Default)
	$(INSTALL_DIR) $(1)/usr/lib
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libstfl.so.$(PKG_VERSION) $(1)/usr/lib/
		$(LN) libstfl.so.$(PKG_VERSION) $(1)/usr/lib/libstfl.so
		$(LN) libstfl.so.$(PKG_VERSION) $(1)/usr/lib/libstfl.so.0
endef

$(eval $(call BuildPackage,libstfl))
