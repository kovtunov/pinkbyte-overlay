# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

WANT_AUTOMAKE="1.11"
AT_M4DIR=./config  # for aclocal called by eautoreconf
inherit linux-info eutils autotools

DESCRIPTION="Solaris Porting Layer - a Linux kernel module providing some Solaris kernel APIs"
HOMEPAGE="http://zfsonlinux.org"
SRC_URI="http://github.com/downloads/zfsonlinux/${PN}/${P/_/-}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 -x86"
IUSE=""

DEPEND="
		virtual/linux-sources
		"
RDEPEND=""

S="${WORKDIR}/${P/_/-}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.6.0-includedir.patch
	eautoreconf
#	cd "${WORKDIR}"
#	./autogen.sh
}

src_configure() {
	set_arch_to_kernel
	econf \
		--with-config=all \
		--with-linux="${KV_OUT_DIR}" \
		--with-linux-obj="${KV_OUT_DIR}"
}

src_install() {
	emake DESTDIR="${D}" install || die 'emake install failed'
	dosym /usr/include/spl/spl_config.h /usr/include/spl/module/spl_config.h \
		|| die
}
