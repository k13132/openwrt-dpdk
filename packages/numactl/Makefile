#
# Copyright (C) 2021      Zbynek Kocur
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=numactl
PKG_VERSION:=2.0.14
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_URL:=https://codeload.github.com/numactl/numactl/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_REMOVE_FILES:=autogen.sh aclocal.m4

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/numactl
   SECTION:=utils
   CATEGORY:=Utilities
   TITLE:=Control NUMA policy for processes or shared memory
   URL:=https://github.com/numactl/numactl
   DEPENDS:=@TARGET_x86_64 +libpthread +libstdcpp +libc +librt +libnuma
endef


define Package/numactl/description
  Simple NUMA policy support. It consists of a numactl program to 
run other programs with a specific NUMA policyi. 
endef

define Package/libnuma
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=NUMA policy library
endef

define Package/libnuma/description
  libnuma shared library ("NUMA API") to set NUMA policy in applications.
The libnuma binary interface is supposed to stay binary compatible.
Incompatible changes will use new symbol version numbers.
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.{a,so*} $(1)/usr/lib/
	
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/numa.pc $(1)/usr/lib/pkgconfig/
endef


define Package/numactl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
endef

define Package/libnuma/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

$(eval $(call BuildPackage,numactl))
$(eval $(call BuildPackage,libnuma))
