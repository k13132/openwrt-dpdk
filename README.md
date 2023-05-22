# Data Plane Development Kit (DPDK) integration into OpenWrt

This repository contains all necessary packages for the compilation of [DPDK](https://www.dpdk.org) on [OpenWrt](https://openwrt.org).

Packages are assembled by information from https://doc.dpdk.org/guides/howto/openwrt.html

## Repository packages

* **[dpdk](https://github.com/DPDK/dpdk)** - Data Plane Development Kit main package; package contains:
  * libdpdk - DPDK librarioes
  * dpdk-tools - DPDK tools
* **kmod-iommu_v2** (required) - kernel-modules support of IOMMU for INTEL/AMD processors; package produces iommu_v2.ko
* **kmod-vfio** (required) - kernel-modules support of Virtual Function I/O for PCI interfaces; package produces - vfio.ko, vfio-pci.ko, vfio_iommu_type1.ko, vfio_virqfd.ko
* **[numactl](https://github.com/numactl/numactl)** (optional) - Simple NUMA policy support package
* **kmod-uio_pci_generic** (optional) - kernel-modules support of The Userspace I/O; package produces - uio.ko, uio_pci_generic.ko

## Compilation & Installation

### Requirements

* Compilation can be done on OpenWrt 21.02 and 22.03.

### OpenWrt build configuration

Make a system from [sources](https://github.com/openwrt/openwrt). Use branches 21.02 or 22.03. 

### Add this repo to an OpenWrt feed.conf

``` 
echo "src-git dpdk_repo https://github.com/k13132/openwrt-dpdk" >> feeds.conf
``` 

### Update OpenWrt package feeds

``` 
./scripts/feeds update dpdk_repo
./scripts/feeds install -a -p dpdk_repo
```

### Use/chose libdpdk, dpdk-tools packages

``` 
make menuconfig
``` 

### Compile DPDK packages

``` 
make package/dpdk/compile
``` 



