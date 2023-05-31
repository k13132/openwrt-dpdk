NULL:=
SPACE:=$(NULL) $(NULL)
COMMA:=,

define Package/libdpdk/config
  source "$(SOURCE)/Config.in"
endef

DRIVERS:= \
	$(if $(CONFIG_LIBDPDK_DRIVER_AXGBE),net/axgbe) \
	$(if $(CONFIG_LIBDPDK_DRIVER_BNX2X),net/bnx2x) \
	$(if $(CONFIG_LIBDPDK_DRIVER_BNXT),net/bnxt) \
	$(if $(CONFIG_LIBDPDK_DRIVER_CNXK),net/cnxk) \
	$(if $(CONFIG_LIBDPDK_DRIVER_CXGBE),net/cxgbe) \
	$(if $(CONFIG_LIBDPDK_DRIVER_DPAA),net/dpaa) \
	$(if $(CONFIG_LIBDPDK_DRIVER_DPAA2),net/dpaa2) \
	$(if $(CONFIG_LIBDPDK_DRIVER_E1000),net/e1000) \
	$(if $(CONFIG_LIBDPDK_DRIVER_ENETC),net/enetc) \
	$(if $(CONFIG_LIBDPDK_DRIVER_ENETFEC),net/enetfec) \
	$(if $(CONFIG_LIBDPDK_DRIVER_I40E),net/i40e) \
	$(if $(CONFIG_LIBDPDK_DRIVER_ICE),net/ice) \
	$(if $(CONFIG_LIBDPDK_DRIVER_COMMON_IAVF),common/iavf) \
	$(if $(CONFIG_LIBDPDK_DRIVER_IXGBE),net/ixgbe) \
	$(if $(CONFIG_LIBDPDK_DRIVER_MVNETA),net/mvneta) \
	$(if $(CONFIG_LIBDPDK_DRIVER_OCTEON_EP),net/octeon_ep) \
	$(if $(CONFIG_LIBDPDK_DRIVER_OCTEONTX),net/octeontx) \
	$(if $(CONFIG_LIBDPDK_DRIVER_PFE),net/pfe) \
	$(if $(CONFIG_LIBDPDK_DRIVER_THUNDERX),net/thunderx) \
	$(if $(CONFIG_LIBDPDK_DRIVER_VIRTIO),net/virtio) \

MESON_ARGS+=\
-Denable_docs=false \
-Denable_drivers=$(subst $(SPACE),$(COMMA),$(strip $(DRIVERS))) \
-Ddisable_drivers=event/* \
$(if $(CONFIG_aarch64),-Dplatform=dpaa)
$(if $(CONFIG_x86_64),-Dplatform=generic -Dcpu_instruction_set=$(strip \
	$(if $(CONFIG_LIBDPDK_ARCH_nocona),nocona) \
	$(if $(CONFIG_LIBDPDK_ARCH_core2),core2) \
	$(if $(CONFIG_LIBDPDK_ARCH_corei7),corei7) \
	$(if $(CONFIG_LIBDPDK_ARCH_westmere),westmere) \
	$(if $(CONFIG_LIBDPDK_ARCH_sandybridge),sandybridge) \
	$(if $(CONFIG_LIBDPDK_ARCH_corei7-avx),corei7-avx) \
	$(if $(CONFIG_LIBDPDK_ARCH_ivybridge),ivybridge) \
	$(if $(CONFIG_LIBDPDK_ARCH_core-avx-i),core-avx-i) \
	$(if $(CONFIG_LIBDPDK_ARCH_haswell),haswell) \
	$(if $(CONFIG_LIBDPDK_ARCH_core-avx2),core-avx2) \
	$(if $(CONFIG_LIBDPDK_ARCH_broadwell),broadwell) \
	$(if $(CONFIG_LIBDPDK_ARCH_skylake),skylake) \
	$(if $(CONFIG_LIBDPDK_ARCH_skylake-avx512),skylake-avx512) \
	$(if $(CONFIG_LIBDPDK_ARCH_cannonlake),cannonlake) \
	$(if $(CONFIG_LIBDPDK_ARCH_icelake-client),icelake-client) \
	$(if $(CONFIG_LIBDPDK_ARCH_icelake-server),icelake-server) \
	$(if $(CONFIG_LIBDPDK_ARCH_bonnell),bonnell) \
	$(if $(CONFIG_LIBDPDK_ARCH_atom),atom) \
	$(if $(CONFIG_LIBDPDK_ARCH_silvermont),silvermont) \
	$(if $(CONFIG_LIBDPDK_ARCH_slm),slm) \
	$(if $(CONFIG_LIBDPDK_ARCH_knl),knl) \
	$(if $(CONFIG_LIBDPDK_ARCH_knm),knm) \
	$(if $(CONFIG_LIBDPDK_ARCH_x86-64),x86-64) \
	$(if $(CONFIG_LIBDPDK_ARCH_eden-x2),eden-x2) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano),nano) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano-1000),nano-1000) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano-2000),nano-2000) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano-3000),nano-3000) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano-x2),nano-x2) \
	$(if $(CONFIG_LIBDPDK_ARCH_eden-x4),eden-x4) \
	$(if $(CONFIG_LIBDPDK_ARCH_nano-x4),nano-x4) \
	$(if $(CONFIG_LIBDPDK_ARCH_k8),x86-64) \
	$(if $(CONFIG_LIBDPDK_ARCH_k8-sse3),k8-sse3) \
	$(if $(CONFIG_LIBDPDK_ARCH_opteron),opteron) \
	$(if $(CONFIG_LIBDPDK_ARCH_opteron-sse3),opteron-sse3) \
	$(if $(CONFIG_LIBDPDK_ARCH_athlon64),athlon64) \
	$(if $(CONFIG_LIBDPDK_ARCH_athlon64-sse3),athlon64-sse3) \
	$(if $(CONFIG_LIBDPDK_ARCH_athlon-fx),athlon-fx) \
	$(if $(CONFIG_LIBDPDK_ARCH_amdfam10),amdfam10) \
	$(if $(CONFIG_LIBDPDK_ARCH_barcelona),barcelona) \
	$(if $(CONFIG_LIBDPDK_ARCH_bdver1),bdver1) \
	$(if $(CONFIG_LIBDPDK_ARCH_bdver2),bdver2) \
	$(if $(CONFIG_LIBDPDK_ARCH_bdver3),bdver3) \
	$(if $(CONFIG_LIBDPDK_ARCH_bdver4),bdver4) \
	$(if $(CONFIG_LIBDPDK_ARCH_znver1),znver1) \
	$(if $(CONFIG_LIBDPDK_ARCH_btver1),btver1) \
	$(if $(CONFIG_LIBDPDK_ARCH_btver2),btver2) \
	$(if $(CONFIG_LIBDPDK_ARCH_native),native) \
))

