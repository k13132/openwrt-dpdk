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

### OpenWrt build configuration

Make a system from [sources](https://github.com/openwrt/openwrt).

* Select ``x86`` in ``Target System``
* Select ``x86_64`` in ``Subtarget``
* Select ``Build the OpenWrt SDK`` for cross-compilation environment
* Select ``Use glibc`` in ``Advanced configuration options (for developers)`` then ``ToolChain Options`` and ``C Library implementation``


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



