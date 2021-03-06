#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dpdk
PKG_VERSION:=20.11
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_URL:=https://codeload.github.com/DPDK/dpdk/tar.gz/v$(PKG_VERSION)?
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=c29bb5710d068efd2bc2c51d73ced4d3ca0dc0f5473874350a0eb3d9c3e50af4

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DEPENDS:=meson/host
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/devel/meson/meson.mk

MESON_ARGS+=-Denable_docs=false

# Possible place for CPU ARCH tune:
# nocona core2 nehalem corei7 westmere sandybridge corei7-avx 
# ivybridge core-avx-i haswell core-avx2 broadwell skylake 
# skylake-avx512 cannonlake icelake-client icelake-server bonnell 
# atom silvermont slm knl knm x86-64 eden-x2 nano nano-1000 nano-2000 
# nano-3000 nano-x2 eden-x4 nano-x4 k8 k8-sse3 opteron opteron-sse3 athlon64 
# athlon64-sse3 athlon-fx amdfam10 barcelona bdver1 bdver2 bdver3 bdver4 
# znver1 btver1 btver2 native
#
# native - works on all x86_64 platforms
#
CONFIG_TARGET_SUBTARGET:="native"

define Package/libdpdk
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libnuma +libpcap +libopenssl +zlib +kmod-vfio-pci +kmod-uio_pci_generic +kmod-amd_iommu_v2
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
  DEPENDS:=+libdpdk +@KERNEL_HUGETLB_PAGE +python3-light
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
endef

$(eval $(call BuildPackage,libdpdk))
$(eval $(call BuildPackage,dpdk-tools))
