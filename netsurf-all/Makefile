# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=netsurf-all
PKG_VERSION:=3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.netsurf-browser.org/netsurf/releases/source-full/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/netsurf-all
	SUBMENU:=Web
	SECTION:=network
	CATEGORY:=Network
	TITLE:=netsurf-all
	URL:=http://www.netsurf-browser.org/
	DEPENDS:=@BUILD_NLS +libjpeg +libpng +libsdl +libxml2 +libcurl +libfreetype +liberation-fonts-ttf \
		+libopenssl $(ICONV_DEPENDS) +libexpat
endef

define Package/netsurf-all/description
	NetSurf is a free, open source web browser. It is written in C and released under the GNU Public Licence version 2. NetSurf has its own layout and rendering engine entirely written from scratch. It is small and capable of handling many of the web standards in use today.
endef

NS_TMP_INST_DIR:=inst-framebuffer
PKG_CONFIG_PATH+=:$(PKG_BUILD_DIR)/$(NS_TMP_INST_DIR)/lib/pkgconfig

MAKE_FLAGS += "TARGET=framebuffer" \
	PREFIX=/usr \
	DESTDIR=$(PKG_INSTALL_DIR)
    
TARGET_CFLAGS += -I$(PKG_BUILD_DIR)/$(NS_TMP_INST_DIR)/include \
	$(ICONV_CFLAGS) \
	-I$(STAGING_DIR)/usr/include/SDL \
	-Wno-error=format-nonliteral \
	-Wno-error=attributes

TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	$(ICONV_LDFLAGS) -liconv \
	-L$(PKG_BUILD_DIR)/$(NS_TMP_INST_DIR)/lib 

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(FILES_DIR)/Makefile.config $(PKG_BUILD_DIR)/netsurf/
	$(CP) $(FILES_DIR)/Makefile.config.override $(PKG_BUILD_DIR)/libparserutils/
	mkdir -p $(PKG_INSTALL_DIR)
endef

define Build/Compile
	$(MAKE_VARS) \
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) \
		$(MAKE_FLAGS)
endef

define Build/Install
	$(MAKE_VARS) \
	$(MAKE) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) \
		install $(MAKE_FLAGS)
endef

define Package/netsurf-all/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/share/netsurf

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/netsurf \
		$(1)/usr/bin/

	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/netsurf/* \
		$(1)/usr/share/netsurf/

	$(CP) $(FILES_DIR)/Choices $(1)/usr/share/netsurf/
	$(CP) $(FILES_DIR)/Cookies $(1)/usr/share/netsurf/
endef

$(eval $(call BuildPackage,netsurf-all))
