#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kiwix
PKG_VERSION:=0.9
PKG_RELEASE:=1
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-server-$(PKG_VERSION)-linux-armv5tejl.tar.bz2
PKG_SOURCE_URL:=@SF/$(PKG_NAME)/$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

UNPACK_CMD:=bzcat $(DL_DIR)/$(PKG_SOURCE) | tar -C $(PKG_BUILD_DIR) -xf -

define Build/Compile
# Do Nothing

endef

define Build/Install
# Do Nothing

endef

define Package/kiwix
  SECTION:=education
  CATEGORY:=Education
  TITLE:=Offline wiki server
  URL:=http://kiwix.org
  DEPENDS:=+links
endef

define Package/kiwix/install
	$(INSTALL_DIR) \
		$(1)/usr/bin/ \
		$(1)/usr/share/kiwix/ \

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/kiwix-serve \
		$(1)/usr/share/kiwix/kiwix-serve

	$(INSTALL_DATA) \
		./files/README \
		$(1)/usr/share/kiwix/README

	$(CP) -r ./files/z2-zim-sample/* \
		$(1)/usr/share/kiwix/

	$(INSTALL_BIN) \
		./files/kiwix \
		$(1)/usr/bin/kiwix
endef

define Package/kiwix/postinst
#!/bin/sh
freespace=$$(df -k / | tail -n 1 | awk '{print $$4}')
if [ $$freespace -gt 65536 ]; then
echo "Creating 64Mb Swap File..."
dd if=/dev/zero of=/usr/share/kiwix/swapfile.64 bs=1024 count=65536
mkswap /usr/share/kiwix/swapfile.64
echo "done."
else
echo "Error: not enough free space for swapfile"
exit 1
fi
endef

$(eval $(call BuildPackage,kiwix))

define Package/kiwix-manage
  SECTION:=education
  CATEGORY:=Education
  TITLE:=Manage offline wiki dumps
  URL:=http://kiwix.org
  DEPENDS:=+kiwix
endef

define Package/kiwix-manage/install
	$(INSTALL_DIR) \
		$(1)/usr/share/kiwix/

	$(INSTALL_BIN) \
		$(PKG_BUILD_DIR)/kiwix-manage \
		$(1)/usr/share/kiwix/kiwix-manage
endef

$(eval $(call BuildPackage,kiwix-manage))
                                                                                  