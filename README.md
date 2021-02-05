# OpenWrt DPDK build packages

echo "src-git dpdkrepo https://github.com/k13132/openwrt-dpdk" >> feeds.conf

./script/feeds update dpdkrepo
./script/feeds install -a -p dpdkrepo

Use libdpdk or dpdk-tools

make package/dpdk/compile
