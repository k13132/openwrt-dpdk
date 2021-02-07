#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=vfio-pci
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

MM_MENU=Virtualization

define KernelPackage/vfio-pci
  SUBMENU:=$(MM_MENU)
  TITLE:=VFIO support for PCI devices
  KCONFIG:=\
      CONFIG_VFIO=m \
      CONFIG_VFIO_IOMMU_TYPE1=m \
      CONFIG_VFIO_VIRQFD=m \
      CONFIG_VFIO_NOIOMMU=y \
      CONFIG_VFIO_PCI=m \
      CONFIG_VFIO_PCI_MMAP=y
  DEPENDS:=@PCI_SUPPORT @TARGET_x86_64 +kmod-irqbypass +kmod-amd_iommu_v2
  FILES:= \
      $(LINUX_DIR)/drivers/vfio/vfio_virqfd.ko \
      $(LINUX_DIR)/drivers/vfio/vfio_iommu_type1.ko \
      $(LINUX_DIR)/drivers/vfio/vfio.ko \
      $(LINUX_DIR)/drivers/vfio/pci/vfio-pci.ko
  AUTOLOAD:=$(call AutoProbe,vfio_virqfd vfio_iommu_type1 vfio vfio-pci)
endef

define KernelPackage/vfio-pci/description
  Support for the PCI VFIO bus driver. This is required to make
use of PCI drivers using the VFIO framework.
endef

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call KernelPackage,vfio-pci))

