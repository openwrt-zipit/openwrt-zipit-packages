#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qemacs
PKG_VERSION:=3.2
PKG_REV:=6c6311756c0e752362b24203bb4c993ae06d62fb
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=git://github.com/deeice/Qemacs.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/qemacs
  TITLE:=qemacs
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=https://github.com/deeice/qemacs/
#  DEPENDS:=+libncurses
  SUBMENU:=Editors
endef

define Package/qemacs/Default/description
qemacs is a small emacs like text editor. 
endef

CONFIGURE_ARGS +=   \
  --enable-tiny     \
  --disable-x11     \
  --disable-xv      \
  --disable-xrender \
  --disable-html    \
  --disable-png     \
  --disable-plugins \
  --cross-prefix="$(TOOLCHAIN_DIR)/bin/$(TARGET_CROSS)"


#MAKE_FLAGS += -f Makefile.zipit

TARGET_LDFLAGS+= \
       -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/qemacs/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/qe $(1)/usr/bin/
endef

$(eval $(call BuildPackage,qemacs))

