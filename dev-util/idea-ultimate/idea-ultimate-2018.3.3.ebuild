# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

SLOT="$(get_major_version)"
RDEPEND=">=virtual/jdk-1.6"

MY_PV="2018.3.3"
MY_PN="idea"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI=" http://download.jetbrains.com/${MY_PN}/${MY_PN}IU-${MY_PV}-no-jdk.tar.gz"
LICENSE="IntelliJ-IDEA"
IUSE=""
KEYWORDS="~x86 ~amd64"
S="${WORKDIR}"'/idea-IU-183.5153.38'

RDEPEND="!dev-util/idea-community"

src_install() {

	local install_dir="/opt/${P}"
    insinto "${install_dir}"
    doins -r *

	fperms 755 "${install_dir}/bin/${MY_PN}.sh"
	fperms 755 "${install_dir}/bin/fsnotifier64"
	fperms 755 "${install_dir}/bin/fsnotifier"
	
	local exe=${MY_PN}-${SLOT}
	local icon=${exe}.png
	newicon "bin/${MY_PN}.png" ${icon}
	dodir /usr/bin
	make_wrapper "$exe" "/opt/${P}/bin/${MY_PN}.sh"
	make_desktop_entry ${exe} "IntelliJ IDEA ${PV}" ${icon} "Development;IDE"
}
