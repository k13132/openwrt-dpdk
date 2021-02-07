#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=amd_iommu_v2
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

MM_MENU=Virtualization


define KernelPackage/amd_iommu_v2
  SUBMENU:=$(MM_MENU)
  TITLE:=AMD IOMMU Version 2 driver
  KCONFIG:=\
     CONFIG_IOMMU_SUPPORT=y \
     CONFIG_AMD_IOMMU=y \
     CONFIG_IRQ_REMAP=y \
     CONFIG_AMD_IOMMU_V2=m
  DEPENDS:= @PCI_SUPPORT @TARGET_x86_64
  FILES:= $(LINUX_DIR)/drivers/iommu/amd_iommu_v2.ko
  AUTOLOAD:=$(call AutoProbe,amd_iommu_v2)
endef

define KernelPackage/amd_iommu_v2/description
  This option enables support for the AMD IOMMUv2 features
of the IOMMU hardware. Select this option if you want
to use devices that suppor the PCI PRI and PASID interface.
endef

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call KernelPackage,amd_iommu_v2))
