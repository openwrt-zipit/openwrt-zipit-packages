#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=obexftp
PKG_VERSION:=0.24.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-Source
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-Source.tar.gz
PKG_SOURCE_URL:=@SF/openobex
PKG_MD5SUM:=157a9d1b2ed220203f7084db906de73c

PKG_BUILD_DEPENDS:=+qemu-host/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/obexftp/Default
  TITLE:=ObexFTP Client/Server
  URL:=https://www.gitorious.org/openobex
endef

define Package/obexftp
$(call Package/obexftp/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+=
  DEPENDS:=+libopenobex +bluez-libs +libexpat +libfuse
endef

CMAKE_OPTIONS += \
	-DBUILD_DOCUMENTATION:BOOL=OFF \
	-DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr \
	-DQEMU_HOST=${STAGING_DIR_HOST}/bin/qemu-arm \
	-DQEMU_LIBS=${TARGET_DIR} \

define Package/obexftp/install
	:
endef

define Package/obexftp/install
	$(INSTALL_DIR) $(1)/usr/bin
		$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/libbfb.so.0.0.6 $(1)/usr/lib/
		$(LN) libbfb.so.0.0.6 $(1)/usr/lib/libbfb.so
		$(LN) libbfb.so.0.0.6 $(1)/usr/lib/libbfb.so.1
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmulticobex.so.1.0.2 $(1)/usr/lib/
		$(LN) libmulticobex.so.1.0.2 $(1)/usr/lib/libmulticobex.so
		$(LN) libmulticobex.so.1.0.2 $(1)/usr/lib/libmulticobex.so.1
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/libobexftp.so.0.3.0 $(1)/usr/lib/
		$(LN) libobexftp.so.0.3.0 $(1)/usr/lib/libobexftp.so
		$(LN) libobexftp.so.0.3.0 $(1)/usr/lib/libobexftp.so.0
endef

$(eval $(call BuildPackage,obexftp))