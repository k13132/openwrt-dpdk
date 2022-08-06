# Data Plane Development Kit (DPDK) integration into OpenWrt

This repository contains all necessary packages for the compilation of [DPDK](https://www.dpdk.org) on [OpenWrt](https://openwrt.org).

Packages are assembled by information from https://doc.dpdk.org/guides/howto/openwrt.html

## Repository packages

* **[dpdk](https://github.com/DPDK/dpdk)** - Data Plane Development Kit main package; package contains:
  * libdpdk - DPDK librarioes
  * dpdk-tools - DPDK tools
* **[numactl](https://github.com/numactl/numactl)** - Simple NUMA policy support package
* **kmod-iommu_v2** - kernel-modules support of IOMMU for INTEL/AMD processors; package produces iommu_v2.ko
* **kmod-uio_pci_generic** - kernel-modules support of The Userspace I/O; package produces - uio.ko, uio_pci_generic.ko
* **kmod-vfio-pci** - kernel-modules support of Virtual Function I/O for PCI interfaces; package produces - vfio.ko, vfio-pci.ko, vfio_iommu_type1.ko, vfio_virqfd.ko

## Compilation & Installation

### Requirements

* Compilation can be done on OpenWrt 22.03 or newer.
* OpenWrt and all packages must be compiled against **glibc**!

### Add this repo to an OpenWrt feed.conf.default

``` 
echo "src-git dpdk_repo https://github.com/k13132/openwrt-dpdk" >> feeds.conf.default
``` 

### Update OpenWrt package feeds

``` 
./scripts/feeds update -a
./scripts/feeds install -a
```

### Use/chose libdpdk, dpdk-tools packages

``` 
make menuconfig
``` 
### OpenWrt build configuration

Make a system from [sources](https://github.com/openwrt/openwrt).

* Select ``x86`` in ``Target System``
* Select ``x86_64`` in ``Subtarget``
* Select ``Build the OpenWrt SDK`` for cross-compilation environment
* Select ``Use glibc`` in ``Advanced configuration options (for developers)`` then ``ToolChain Options`` and ``C Library implementation``

```
vi .config
```
# Kernel build options
CONFIG_KERNEL_CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_KERNEL_CONFIG_VFIO_VIRQFD=y
CONFIG_KERNEL_CONFIG_VFIO=y
CONFIG_KERNEL_CONFIG_VFIO_NOIOMMU=y
CONFIG_KERNEL_CONFIG_VFIO_PCI=y
CONFIG_KERNEL_CONFIG_VFIO_PCI_MMAP=y
CONFIG_KERNEL_CONFIG_HUGETLBFS=y
CONFIG_KERNEL_CONFIG_HUGETLB_PAGE=y
CONFIG_KERNEL_CONFIG_PROC_PAGE_MONITOR=y
CONFIG_KERNEL_CONFIG_UIO=y
# end of Kernel build options

```
vi config/Config-kernel.in
```
config KERNEL_CONFIG_VFIO_IOMMU_TYPE1
        bool "KERNEL_CONFIG_VFIO_IOMMU_TYPE1"
        default y
config KERNEL_CONFIG_VFIO_VIRQFD
        bool "KERNEL_CONFIG_VFIO_VIRQFD"
        default y
config KERNEL_CONFIG_VFIO
        bool "KERNEL_CONFIG_VFIO"
        default y
config KERNEL_CONFIG_VFIO_NOIOMMU
        bool "KERNEL_CONFIG_VFIO_NOIOMMU"
        default y
config KERNEL_CONFIG_VFIO_PCI
        bool "KERNEL_CONFIG_VFIO_PCI"
        default y
config KERNEL_CONFIG_VFIO_PCI_MMAP
        bool "KERNEL_CONFIG_VFIO_PCI_MMAP"
        default y

config KERNEL_CONFIG_HUGETLBFS
        bool "KERNEL_CONFIG_HUGETLBFS"
        default y
config KERNEL_CONFIG_HUGETLB_PAGE
        bool "KERNEL_CONFIG_HUGETLB_PAGE"
        default y
config KERNEL_CONFIG_PROC_PAGE_MONITOR
        bool "KERNEL_CONFIG_PROC_PAGE_MONITOR"
        default y

config KERNEL_CONFIG_UIO
        bool "KERNEL_CONFIG_UIO"
        default y

config KERNEL_NUMA_BALANCING
        bool "KERNEL_CONFIG_NUMA_BALANCING"
        default y

config KERNEL_NUMA
        bool "KERNEL_CONFIG_NUMA"
        default y
config KERNEL_AMD_NUMA
        bool "KERNEL_CONFIG_AMD_NUMA"
        default y
config KERNEL_X86_64_ACPI_NUMA
        bool "KERNEL_CONFIG_X86_64_ACPI_NUMA"
        default y
config KERNEL_USE_PERCPU_NUMA_NODE_ID
        bool "KERNEL_CONFIG_USE_PERCPU_NUMA_NODE_ID"
        default y
config KERNEL_ACPI_NUMA
        bool "KERNEL_CONFIG_ACPI_NUMA"
        default y

### Compile firmware and DPDK packages

``` 
make -j1 V=s
``` 



