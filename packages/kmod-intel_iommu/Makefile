#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=intel_iommu
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

MM_MENU=Virtualization


define KernelPackage/intel_iommu
  SUBMENU:=$(MM_MENU)
  TITLE:=INTEL IOMMU driver
  KCONFIG:=\
     CONFIG_IOMMU_SUPPORT=y \
     CONFIG_IRQ_REMAP=y \
     CONFIG_INTEL_IOMMU=y
  DEPENDS:= @PCI_SUPPORT @TARGET_x86_64
  FILES:= $(LINUX_DIR)/drivers/iommu/intel_iommu.ko
  AUTOLOAD:=$(call AutoProbe,intel_iommu)
endef

define KernelPackage/intel_iommu/description
  This option enables support for the INTEL IOMMU features
of the IOMMU hardware. Select this option if you want
to use devices that suppor the PCI PRI and PASID interface.
endef

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call KernelPackage,intel_iommu))
