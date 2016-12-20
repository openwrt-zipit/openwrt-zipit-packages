#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=movgrab
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://sites.google.com/site/columscode/files/
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=libopenssl

include $(INCLUDE_DIR)/package.mk

define Package/movgrab
  TITLE:=movgrab
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=https://sites.google.com/site/columscode/home/movgrab
  DEPENDS:=+libcrypto +libopenssl
endef

define Package/movgrab/description
	Simple downloader for videos from various websites
endef

define Build/Configure
	$(call Build/Configure/Default,\
		)
endef

define Package/movgrab/install
	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/movgrab $(1)/usr/bin/
endef

$(eval $(call BuildPackage,movgrab))
