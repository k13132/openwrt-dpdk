#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dpdk
PKG_VERSION:=23.11
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_URL:=https://codeload.github.com/DPDK/dpdk/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=6f87e929ad7a185cedb3caa2217e1eb182e6393b101ecc6e1c1635b5bd84275e

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

# Edit drivers filters by your own. Now it compile only Intel i40e and e1000 drivers. Events aren't compiled too.
MESON_ARGS+=-Denable_docs=false -Denable_drivers=net/i40e,net/e1000,net/virtio -Ddisable_drivers=event/*

# Required by MUSL for building
ifneq ($(CONFIG_USE_MUSL),)
  TARGET_CFLAGS += -D_LARGEFILE64_SOURCE
endif

define Package/libdpdk
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=@(x86_64||arm||aarch64) +@KERNEL_HUGETLB_PAGE +librt +libpthread +libbpf +libpcap +libopenssl +zlib +jansson +libelf +libarchive +libbsd +libkmod +libnuma
  TITLE:=Set of libraries and drivers for fast packet processing
  URL:=https://www.dpdk.org
endef

define Package/libdpdk/description
  DPDK is a set of libraries and drivers for fast packet processing.
It supports many processor architectures and both FreeBSD and Linux.
endef

define Package/dpdk-tools
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@(x86_64||arm||aarch64) +libdpdk +python3-light
  TITLE:=Set of tools for fast packet processing based on DPDK
  URL:=https://www.dpdk.org
endef

define Package/dpdk-tools/description
  DPDK is a set of libraries and drivers for fast packet processing.
It supports many processor architectures and both FreeBSD and Linux.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/rte_*.h $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/include/generic/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/generic/rte_*.h $(1)/usr/include/generic/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/{librte_*.a,librte_*.so*,dpdk} $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libdpdk*.pc $(1)/usr/lib/pkgconfig/
endef


define Package/libdpdk/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/librte_*.so.* $(1)/usr/lib/
endef
		
define Package/dpdk-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpdk-devbind.py $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpdk-pdump $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpdk-proc-info $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpdk-testpmd $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dpdk-test-flow-perf $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libdpdk))
$(eval $(call BuildPackage,dpdk-tools))
