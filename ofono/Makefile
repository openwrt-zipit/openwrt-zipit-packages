#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ofono
PKG_VERSION:=1.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://git.kernel.org/pub/scm/network/ofono/ofono.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/ofono
  SECTION:=network
  CATEGORY:=Network
  TITLE:=ofono
  URL:=https://01.org/ofono
  DEPENDS:=+glib2 +libdbus
endef

define Package/ofono/description
  Cellular Modem Daemon
endef

define Build/Prepare   
	$(call Build/Prepare/Default)
	(wget http://git.gnome.org/browse/mobile-broadband-provider-info/tree/serviceproviders.xml \
		-O $(PKG_BUILD_DIR)/serviceproviders.xml)
endef

CONFIGURE_ARGS += \
	--with-provisiondb=serviceproviders.xml \
	--with-systemdunitdir= \
	--disable-udev \
	--disable-bluetooth \
	--enable-tools

define Package/ofono/install
	$(call Build/Install/Default)
	$(INSTALL_DIR) $(1)/usr/sbin
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ofonod $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/ofono
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/ofono/phonesim.conf $(1)/etc/ofono/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/ofono.pc $(1)/usr/lib/pkgconfig
	$(INSTALL_DIR) $(1)/usr/include
		$(CP) $(PKG_INSTALL_DIR)/usr/include/ofono $(1)/usr/include/
endef

$(eval $(call BuildPackage,ofono))
