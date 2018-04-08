# Copyright (C) 2010 tuxbrain.com
#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dosbox
PKG_VERSION:=0.74-svn
PKG_RELEASE:=1

# 0.74
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=@SF/$(PKG_NAME)

# 0.74-svn
PKG_REV:=r4000
PKG_SOURCE=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk/
PKG_SOURCE_PROTO:=svn
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

# 0.74-svn-daum
#http://www.msu.edu/~yootaewo/_db/20150125_32bit.7z
#https://github.com/aybe/dosbox-svn-daum
#PKG_REV:=bd7891dde34a20f00fd953921441f9cce8eb28ed
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
#PKG_SOURCE_URL:=git://github.com/aybe/dosbox-svn-daum.git
#PKG_SOURCE_PROTO:=git
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
#PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
include $(INCLUDE_DIR)/package.mk

define Package/dosbox
    TITLE:=DOSBox PC Emulator
    SECTION:=emulators
    CATEGORY:=Emulators
    DEPENDS:=+libsdl +libsdl-sound +libpng +libstdcpp
    URL:=http://www.dosbox.com/
endef 

define Package/dosbox/description
	DOSBox emulates an Intel x86 PC for running many old MS-DOS
endef

#MAKE_FLAGS += AR="$(TARGET_CROSS)ar cru" LD="$(TARGET_CXX)"

TARGET_CFLAGS += -DZ2 \
	-fpermissive

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-sdltest \
		--disable-alsa-midi \
		--disable-dynamic-x86 \
		--disable-fpu-x86 \
		--disable-alsatest \
		--disable-opengl \
		--disable-printer \
	)
endef

define Package/dosbox/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dosbox $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dosbox))
