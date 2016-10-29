#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=password-store
PKG_VERSION:=1.6.5
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://git.zx2c4.com/password-store/snapshot
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

#PKG_BUILD_DEPENDS:=gpsd

include $(INCLUDE_DIR)/package.mk

define Package/password-store
  TITLE:=password-store
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=https://www.passwordstore.org
  DEPENDS:=+bash +pwgen +getopt +tree +gnupg +coreutils-sort +grep
endef

define Package/password-store/description
	A simple password store for cli
endef

TARGET_LDFLAGS+= \
       -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/password-store/install
	$(call Build/Install/Default)

	$(INSTALL_DIR) \
		$(1)/usr/bin/

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pass \
		$(1)/usr/bin/pass
endef

$(eval $(call BuildPackage,password-store))
