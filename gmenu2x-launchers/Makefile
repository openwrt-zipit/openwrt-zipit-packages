#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gmenu2x-launchers
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)

include $(INCLUDE_DIR)/package.mk

define Build/Compile

endef

define Package/gmenu2x-tmux
  CATEGORY:=GMenu2X
  TITLE:=tmux launcher for gmenu2x
  DEPENDS:=+gmenu2x +tmux
  VARIANT:=gmenu2x-tmux
endef

define Package/gmenu2x-tmux/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ 
	$(CP) \
		./files/tmux/gmenu2x/* \
		$(1)/usr/share/gmenu2x/

	$(INSTALL_DIR) $(1)/etc/ 
	$(CP) \
		./files/tmux/tmux.conf \
		$(1)/etc/tmux.conf
endef

$(eval $(call BuildPackage,gmenu2x-tmux))

define Package/gmenu2x-ohboy
  CATEGORY:=GMenu2X
  TITLE:=ohboy launcher for gmenu2x
  DEPENDS:=+gmenu2x +ohboy
  VARIANT:=gmenu2x-ohboy
endef

define Package/gmenu2x-ohboy/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/ohboy/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-ohboy))

define Package/gmenu2x-links
  CATEGORY:=GMenu2X
  TITLE:=links launcher for gmenu2x
  DEPENDS:=+gmenu2x +links
  VARIANT:=gmenu2x-links
endef

define Package/gmenu2x-links/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/links/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-links))

define Package/gmenu2x-gmu
  CATEGORY:=GMenu2X
  TITLE:=GMU launcher for gmenu2x
  DEPENDS:=+gmenu2x +gmu
  VARIANT:=gmenu2x-gmu
endef

define Package/gmenu2x-gmu/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/gmu/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-gmu))

define Package/gmenu2x-burgerspace
  CATEGORY:=GMenu2X
  TITLE:=Burgerspace launcher for gmenu2x
  DEPENDS:=+gmenu2x +burgerspace
  VARIANT:=gmenu2x-burgerspace
endef

define Package/gmenu2x-burgerspace/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/burgerspace/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-burgerspace))

define Package/gmenu2x-supertux
  CATEGORY:=GMenu2X
  TITLE:=Supertux launcher for gmenu2x
  DEPENDS:=+gmenu2x +supertux
  VARIANT:=gmenu2x-supertux
endef

define Package/gmenu2x-supertux/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/supertux/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-supertux))

define Package/gmenu2x-netsurf
  CATEGORY:=GMenu2X
  TITLE:=Netsurf launcher for gmenu2x
  DEPENDS:=+gmenu2x +netsurf-all
  VARIANT:=gmenu2x-netsurf
endef

define Package/gmenu2x-netsurf/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/netsurf/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-netsurf))

define Package/gmenu2x-freedoom1
  CATEGORY:=GMenu2X
  TITLE:=FreeDoom1 launcher for gmenu2x
  DEPENDS:=+gmenu2x +freedoom1
  VARIANT:=gmenu2x-freedoom1
endef

define Package/gmenu2x-freedoom1/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/freedoom1/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-freedoom1))

define Package/gmenu2x-freedoom2
  CATEGORY:=GMenu2X
  TITLE:=FreeDoom2 launcher for gmenu2x
  DEPENDS:=+gmenu2x +freedoom2
  VARIANT:=gmenu2x-freedoom2
endef

define Package/gmenu2x-freedoom2/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/freedoom2/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-freedoom2))

define Package/gmenu2x-nano
  CATEGORY:=GMenu2X
  TITLE:=Nano launcher for gmenu2x
  DEPENDS:=+gmenu2x +nano
  VARIANT:=gmenu2x-nano
endef

define Package/gmenu2x-nano/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/nano/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-nano))

define Package/gmenu2x-alsamixer
  CATEGORY:=GMenu2X
  TITLE:=Alsamixer launcher for gmenu2x
  DEPENDS:=+gmenu2x +alsa-utils
  VARIANT:=gmenu2x-alsamixer
endef

define Package/gmenu2x-alsamixer/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/alsamixer/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-alsamixer))

define Package/gmenu2x-nethack
  CATEGORY:=GMenu2X
  TITLE:=nethack launcher for gmenu2x
  DEPENDS:=+gmenu2x +nethack
  VARIANT:=gmenu2x-nethack
endef

define Package/gmenu2x-nethack/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/nethack/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-nethack))

define Package/gmenu2x-newsbeuter
	CATEGORY:=GMenu2X
	TITLE:=newsbeuter/podbeuter launcher for gmenu2x
	DEPENDS:=+gmenu2x +newsbeuter
	VARIANT:=gmenu2x-newsbeuter
endef

define Package/gmenu2x-newsbeuter/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/newsbeuter/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-newsbeuter))

define Package/gmenu2x-imgv
	CATEGORY:=GMenu2X
	TITLE:=imgv launcher for gmenu2x
	DEPENDS:=+gmenu2x +imgv
	VARIANT:=gmenu2x-imgv
endef

define Package/gmenu2x-imgv/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/imgv/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-imgv))

define Package/gmenu2x-nupdf
	CATEGORY:=GMenu2X
	TITLE:=nupdf launcher for gmenu2x
	DEPENDS:=+gmenu2x +nupdf
	VARIANT:=gmenu2x-nupdf
endef

define Package/gmenu2x-nupdf/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/nupdf/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-nupdf))

define Package/gmenu2x-pspmaps
	CATEGORY:=GMenu2X
	TITLE:=pspmaps launcher for gmenu2x
	DEPENDS:=+gmenu2x +pspmaps
	VARIANT:=gmenu2x-pspmaps
endef

define Package/gmenu2x-pspmaps/install   
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/pspmaps/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-pspmaps))

define Package/gmenu2x-navit
	CATEGORY:=GMenu2X
	TITLE:=navit launcher for gmenu2x
	DEPENDS:=+gmenu2x +navit
	VARIANT:=gmenu2x-navit
endef

define Package/gmenu2x-navit/install   
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/navit/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-navit))

define Package/gmenu2x-kiwix
	CATEGORY:=GMenu2X
	TITLE:=kiwix launcher for gmenu2x
	DEPENDS:=+gmenu2x +kiwix
	VARIANT:=gmenu2x-kiwix
endef

define Package/gmenu2x-kiwix/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/kiwix/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-kiwix))

define Package/gmenu2x-mutt
	CATEGORY:=GMenu2X
	TITLE:=mutt launcher for gmenu2x
	DEPENDS:=+gmenu2x +mutt
	VARIANT:=gmenu2x-mutt
endef

define Package/gmenu2x-mutt/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/mutt/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-mutt))

define Package/gmenu2x-wolf3d
	CATEGORY:=GMenu2X
	TITLE:=wolf3d launcher for gmenu2x
	DEPENDS:=+gmenu2x +wolf4sdl +wolf3d-shareware
	VARIANT:=gmenu2x-wolf3d
endef

define Package/gmenu2x-wolf3d/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/wolf3d/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-wolf3d))

define Package/gmenu2x-sdlquake
	CATEGORY:=GMenu2X
	TITLE:=sdlquake launcher for gmenu2x
	DEPENDS:=+gmenu2x +sdlquake +sdlquake-shareware-data
	VARIANT:=gmenu2x-sdlquake
endef

define Package/gmenu2x-sdlquake/install
	$(INSTALL_DIR) \
		$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/sdlquake/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-sdlquake))

define Package/gmenu2x-mpg123
	CATEGORY:=GMenu2X
	TITLE:=mpg123 launcher for gmenu2x
	DEPENDS:=+gmenu2x +mpg123 +dialog
	VARIANT:=gmenu2x-mpg123
endef

define Package/gmenu2x-mpg123/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/
	$(CP) ./files/mpg123/usr/share/gmenu2x/* \
		$(1)/usr/share/gmenu2x/

	$(INSTALL_DIR) $(1)/usr/local/bin/
	$(INSTALL_BIN) ./files/mpg123/usr/local/bin/* \
		$(1)/usr/local/bin/

	$(INSTALL_DIR) $(1)/usr/share/sounds/
	$(CP) ./files/mpg123/usr/share/sounds/* \
		$(1)/usr/share/sounds/

	$(INSTALL_DIR) $(1)/root/music/
	$(LN) -s /usr/share/sounds/alarm.mp3 $(1)/root/music/alarm.mp3
	$(LN) -s /usr/share/sounds/zipit16.mp3 $(1)/root/music/zipit16.mp3

	$(INSTALL_DIR) $(1)/root/radio/
	$(CP) ./files/mpg123/root/radio/* \
		$(1)/root/radio/

	$(INSTALL_DIR) $(1)/usr/share/consolefonts/
	$(CP) ./files/mpg123/usr/share/consolefonts/* \
		$(1)/usr/share/consolefonts/

	$(INSTALL_DIR) $(1)/etc
	$(LN) -s /usr/share/consolefonts/5x8iz2s.psf $(1)/etc/consolefont.psf
endef

$(eval $(call BuildPackage,gmenu2x-mpg123))

define Package/gmenu2x-mplayer
	CATEGORY:=GMenu2X
	TITLE:=mplayer launcher for gmenu2x
	DEPENDS:=+gmenu2x +mplayer
	VARIANT:=gmenu2x-mplayer
endef

define Package/gmenu2x-mplayer/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/mplayer/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-mplayer))

define Package/gmenu2x-rockbox
	CATEGORY:=GMenu2X
	TITLE:=rockbox launcher for gmenu2x
	DEPENDS:=+gmenu2x +rockbox
	VARIANT:=gmenu2x-rockbox
endef

define Package/gmenu2x-rockbox/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/rockbox/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-rockbox))

define Package/gmenu2x-respeqt
	CATEGORY:=GMenu2X
	TITLE:=RespeQt launcher for gmenu2x
	DEPENDS:=+gmenu2x +respeqt
	VARIANT:=gmenu2x-respeqt
endef

define Package/gmenu2x-respeqt/install
	$(INSTALL_DIR) \
	$(1)/usr/share/gmenu2x/ \

	$(CP) \
		./files/respeqt/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-respeqt))

define Package/gmenu2x-sio2zipit
	CATEGORY:=GMenu2X
	TITLE:=sio2bsd launcher for gmenu2x
	DEPENDS:=+gmenu2x +sio2bsd
	VARIANT:=gmenu2x-sio2zipit
endef

define Package/gmenu2x-sio2zipit/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/
	$(CP) \
		./files/sio2zipit/gmenu2x/* \
		$(1)/usr/share/gmenu2x/

	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) \
		./files/sio2zipit/sio2zipit \
		$(1)/usr/bin/sio2zipit
endef

$(eval $(call BuildPackage,gmenu2x-sio2zipit))

define Package/gmenu2x-sz81
    CATEGORY:=GMenu2X
    TITLE:=sz81 launcher for gmenu2x
    DEPENDS:=+gmenu2x +sz81
    VARIANT:=gmenu2x-sz81
endef

define Package/gmenu2x-sz81/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/

	$(CP) \
		./files/sz81/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-sz81))

define Package/gmenu2x-fuse-emulator
    CATEGORY:=GMenu2X
    TITLE:=fuse-emulator launcher for gmenu2x
    DEPENDS:=+gmenu2x +fuse-emulator +termfix
    VARIANT:=gmenu2x-fuse-emulator
endef

define Package/gmenu2x-fuse-emulator/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/

	$(CP) \
		./files/fuse-emulator/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-fuse-emulator))

define Package/gmenu2x-ziptuner
    CATEGORY:=GMenu2X
    TITLE:=ziptuner launcher for gmenu2x
    DEPENDS:=+gmenu2x +ziptuner +gmenu2x-mpg123
    VARIANT:=gmenu2x-ziptuner
endef

define Package/gmenu2x-ziptuner/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/

	$(CP) \
		./files/ziptuner/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-ziptuner))

define Package/gmenu2x-sdlvnc
    CATEGORY:=GMenu2X
    TITLE:=sdlvnc launcher for gmenu2x
    DEPENDS:=+gmenu2x +sdlvnc
    VARIANT:=gmenu2x-sdlvnc
endef

define Package/gmenu2x-sdlvnc/install
	$(INSTALL_DIR) $(1)/usr/share/gmenu2x/

	$(CP) \
		./files/sdlvnc/* \
		$(1)/usr/share/gmenu2x/
endef

$(eval $(call BuildPackage,gmenu2x-sdlvnc))