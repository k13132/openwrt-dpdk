#
# Copyright (C) 2023 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=vfio
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=Zbynek Kocur <zbynek.kocur@fel.cvut.cz>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define KernelPackage/vfio
  SUBMENU:=Virtualization
  TITLE:=VFIO Non-Privileged userspace driver framework
  DEPENDS:=@TARGET_x86_64
  KCONFIG:= \
        CONFIG_VFIO \
        CONFIG_VFIO_NOIOMMU=n \
        CONFIG_VFIO_MDEV=n
  MODPARAMS.vfio:=\
        enable_unsafe_noiommu_mode=n
  FILES:= \
        $(LINUX_DIR)/drivers/vfio/vfio.ko \
        $(LINUX_DIR)/drivers/vfio/vfio_virqfd.ko \
        $(LINUX_DIR)/drivers/vfio/vfio_iommu_type1.ko
  AUTOLOAD:=$(call AutoProbe,vfio vfio_iommu_type1 vfio_virqfd)
endef

define KernelPackage/vfio/description
  VFIO provides a framework for secure userspace device drivers.
endef

define Build/Configure
  true
endef

define Build/Compile
  true
endef

$(eval $(call KernelPackage,vfio))

define KernelPackage/vfio-pci
  SUBMENU:=Virtualization
  TITLE:=Generic VFIO support for any PCI device
  DEPENDS:=@TARGET_x86_64 @PCI_SUPPORT +kmod-vfio +kmod-irqbypass
  KCONFIG:= \
        CONFIG_VFIO_PCI \
        CONFIG_VFIO_PCI_IGD=n
  FILES:= \
        $(LINUX_DIR)/drivers/vfio/pci/vfio-pci.ko
  AUTOLOAD:=$(call AutoProbe,vfio-pci)
endef

define KernelPackage/vfio-pci/description
  Support for the generic PCI VFIO bus driver which can connect any PCI
  device to the VFIO framework.
endef

define Build/Configure
  true
endef

define Build/Compile
  true
endef

$(eval $(call KernelPackage,vfio-pci))