# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=newsbeuter
PKG_VERSION:=2.9

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://newsbeuter.org/downloads/

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/newsbeuter
	SECTION:=network
	CATEGORY:=Network
	TITLE:=newsbeuter
	URL:=http://newsbeuter.org/index.html
	DEPENDS:=+@BUILD_NLS +libncursesw +libstfl +libsqlite3 +libcurl +libjson-c +libstdcpp \
		+libxml2 $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/newsbeuter/description
	Newsbeuter is an open-source RSS/Atom feed reader for text terminals.
	Podbeuter (included) is for downloading podcasts queued by newsbeuter.
endef

TARGET_CFLAGS+= $(ICONV_CFLAGS) \
	$(INTL_CFLAGS)

TARGET_LDFLAGS+= -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(ICONV_LDFLAGS) -liconv \
	$(INTL_LDLAGS) -lintl

define Package/newsbeuter/install
	$(call Build/Install/Default)
	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/bin/newsbeuter $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/bin/podbeuter $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/root/.newsbeuter
		$(INSTALL_DATA) ./files/config $(1)/root/.newsbeuter
		$(INSTALL_DATA) ./files/urls $(1)/root/.newsbeuter
endef

$(eval $(call BuildPackage,newsbeuter))
