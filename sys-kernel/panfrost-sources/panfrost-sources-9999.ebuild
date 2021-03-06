# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

ETYPE=sources
#K_DEFCONFIG="odroidc_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION="-${PN}/-*"

inherit kernel-2
#do gentoo patches 

detect_version
detect_arch

inherit git-r3 versionator

EGIT_REPO_URI="https://gitlab.freedesktop.org/panfrost/linux.git"

EGIT_CHECKOUT_DIR="$S"

DESCRIPTION="Linux source for Panfrost opensource genric Mali drivers"
# rockpro64 rock64, pine64,  other rockchip devices 
# akin to open nvidia drivers ie nuevo.. 
HOMEPAGE="https://github.com/hardkernel/linux"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~arm ~arm64"

RDEPEND="sys-devel/bc"
RDEPEND="
	app-arch/lzop
	|| ( dev-embedded/u-boot-tools )
	"

src_unpack()
{
	git-r3_src_unpack
	unpack_set_extraversion
}
