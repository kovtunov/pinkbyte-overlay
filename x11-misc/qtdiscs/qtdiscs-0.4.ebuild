# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit qt4-r2 eutils
SRC_URI="https://github.com/Pinkbyte/qtdiscs/tarball/${PV} -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/Pinkbyte-qtdiscs-1869819"

DESCRIPTION="QtDiscs is a little program to show information about CD and DVD discs collection"
HOMEPAGE="http://github.com/Pinkbyte/qtdiscs"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="x11-libs/qt-gui:4
x11-libs/qt-sql:4"

DEPEND="${RDEPEND}"

src_install() {
	qt4-r2_src_install
	dodoc README
}
