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
		--enable-ssl)
endef

#       The musl build has issues with sockets timing out in select()
#       So for now use a static build made with uclibc.
#	$(INSTALL_DIR) $(1)/usr/bin/
#		$(INSTALL_BIN) $(PKG_BUILD_DIR)/movgrab $(1)/usr/bin/

define Package/movgrab/install
	$(INSTALL_DIR) $(1)/usr/bin/
		$(INSTALL_BIN) $(FILES_DIR)/movgrab $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/local/bin/
		$(INSTALL_BIN) $(FILES_DIR)/playtube* $(1)/usr/local/bin/
		$(INSTALL_BIN) $(FILES_DIR)/fifosize $(1)/usr/local/bin/

	$(INSTALL_DIR) $(1)/root/
		$(INSTALL_DATA) $(FILES_DIR)/links.cfg $(1)/root/
		$(INSTALL_DATA) $(FILES_DIR)/mobilist.html $(1)/root/
endef

define Package/movgrab/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
  if [ ! -e /root/.links/links.cfg ] ; then
    echo installing links.cfg
    cp /root/links.cfg /root/.links/links.cfg
  elif [ "b1feff2a5c0cebf9f61455f002b84d74" = "$(md5sum /root/.links/links.cfg | cut -d ' ' -f 1)" ] ; then
    echo updating default links.cfg
    cp /root/links.cfg /root/.links/links.cfg
  else
    echo updating links.cfg
    if [ -z "$(grep "audio/x-scpls" /root/.links/links.cfg)" ] ; then
	echo Adding association "audio/x-scpls" to links.cfg
	echo 'association "mp3-pls" "audio/x-scpls" "mpg123tty4 -C@ %" 21 1' >> links.cfg
    fi
    if [ -z "$(grep "audio/x-mpegurl" /root/.links/links.cfg)" ] ; then
	echo Adding association "audio/x-scpls" to links.cfg
	echo 'association "radio" "audio/x-mpegurl" "mpg123tty4 -C@ %" 21 1' >> links.cfg
    fi
    if [ -z "$(grep "audio/x-mpeg" /root/.links/links.cfg)" ] ; then
	echo Adding association "audio/x-scpls" to links.cfg
	echo 'association "mpg123" "audio/x-mpeg" "mpg123tty4 -C %" 21 1' >> links.cfg
    fi
    if [ -z "$(grep "audio/x-ogg" /root/.links/links.cfg)" ] ; then
	echo Adding association "audio/x-scpls" to links.cfg
	echo 'association "mplayer" "audio/x-ogg" "mplayer -playlist %" 19 1' >> links.cfg
    fi
    if [ -z "$(grep "application/zyt" /root/.links/links.cfg)" ] ; then
	echo Adding association "audio/x-scpls" to links.cfg
	echo 'association "Zipit YouTube" "application/zyt" "playtube %" 15 1' >> links.cfg
	echo 'extension "zyt" "application/zyt"' >> links.cfg
    fi
    if [ -z "$(grep "tn3270" /root/.links/links.cfg)" ] ; then
	echo Adding tn3270 "mplayer" to links.cfg
	echo 'tn3270 "mplayer %" 1' >> links.cfg
    fi
  fi
fi
exit 0
endef


$(eval $(call BuildPackage,movgrab))
