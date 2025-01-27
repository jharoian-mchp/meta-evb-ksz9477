FILESEXTRAPATHS:prepend := "${THISDIR}/configs:"

COMPATIBLE_MACHINE = '(sama5d3-xplained|sama5d3-xplained-sd|sama5d4-xplained|sama5d4-xplained-sd|sama5d2-xplained|sama5d2-xplained-sd|sama5d2-xplained-emmc|sama5d2-ptc-ek|sama5d2-ptc-ek-sd|sama5d27-som1-ek|sama5d27-som1-ek-sd|sama5d27-som1-ek-optee-sd|sama5d2-icp-sd|sam9x60ek|sam9x60ek-sd|sama5d27-wlsom1-ek-sd|sama5d29-curiosity-sd|sama7g5ek-sd|sama7g5ek-emmc|sama7g5ek-ospi|sam9x60-curiosity|sam9x60-curiosity-sd|sam9x75-curiosity|sam9x75-curiosity-sd|sam9x75eb|sam9x75eb-sd|sama5d3-eds-sd)'

AT91BOOTSTRAP_CONFIG:sama5d3-eds-sd ??= "${AT91BOOTSTRAP_MACHINE}sd_uboot"

AT91BOOTSTRAP_LOAD:sama5d3-eds-sd ??= "sdboot-uboot"

SRC_URI:append = " file://${AT91BOOTSTRAP_TARGET}"

do_configure:prepend() {
	# Copy board defconfig to .config if .config does not exist. 
	# Depends on copying the file from the config directory in the meta-evb-9477 layer
	if [ -f "${WORKDIR}/${AT91BOOTSTRAP_TARGET}" ] && [ ! -f "${B}/.config" ]; then
		cp "${WORKDIR}/${AT91BOOTSTRAP_TARGET}" "${B}/.config"
	fi
}
