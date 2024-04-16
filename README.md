# Data Plane Development Kit (DPDK) integration into OpenWrt

This repository contains all necessary packages for the compilation of [DPDK](https://www.dpdk.org) on [OpenWrt](https://openwrt.org). CPU architectures x86_64 and aarch64 are supported.

Packages are assembled by information from https://doc.dpdk.org/guides/howto/openwrt.html.

## Repository packages

* **[dpdk](https://github.com/DPDK/dpdk)** - Data Plane Development Kit main package; package contains:
  * libdpdk - DPDK librarioes
  * dpdk-tools - DPDK tools
* **kmod-iommu_v2** (this pkg required for 21.02, 22.03) - kernel-modules support of IOMMU for INTEL/AMD processors; package produces iommu_v2.ko
* **kmod-vfio** (this pkg required for 21.02, 22.03) - kernel-modules support of Virtual Function I/O for PCI interfaces; package produces - vfio.ko, vfio-pci.ko, vfio_iommu_type1.ko, vfio_virqfd.ko
* **[numactl](https://github.com/numactl/numactl)** (required) - Simple NUMA policy support package

OpenWrt 23 and newer has **kmod-iommu_v2** and **kmod-vfio** directly in menuconfig.

## Compilation & Installation

### Requirements

* Compilation can be done on OpenWrt 21.02, 22.03 and 23.05.

### OpenWrt build configuration

Make a system from [sources](https://github.com/openwrt/openwrt). Use branches 21.02, 22.03 or 23.05. 

### Add this repo to OpenWrt feed.conf

``` 
echo "src-git dpdk_repo https://github.com/k13132/openwrt-dpdk" >> feeds.conf
``` 

### Update OpenWrt package feeds

``` 
./scripts/feeds update dpdk_repo
./scripts/feeds install -a -p dpdk_repo
```

### Use/select libdpdk, dpdk-tools packages

- Select platform for AARCH64 - https://doc.dpdk.org/guides/linux_gsg/cross_build_dpdk_for_arm64.html#supported-soc-configuration 
- Select cpu_instruction_set for x86_64 - https://doc.dpdk.org/guides/linux_gsg/build_dpdk.html
- Select network drivers - https://doc.dpdk.org/guides/nics/overview.html
``` 
make menuconfig
``` 

### Compile DPDK packages

``` 
make package/dpdk/compile -j$((`nproc`+1))
``` 
