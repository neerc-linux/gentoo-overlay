# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"

inherit eutils pam python

MY_PN="pam-python"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Allows PAM modules to be written in Python"
HOMEPAGE="http://ace-host.stuart.id.au/russell/files/pam_python/"
SRC_URI="http://ace-host.stuart.id.au/russell/files/pam_python/${MY_P}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

RDEPEND=">=sys-libs/pam-0.76"
DEPEND=">=sys-libs/pam-0.76
		doc? ( dev-python/sphinx )"

src_compile() {
	if use doc; then
		TARGET="all"
	else
		TARGET="lib"
	fi
	emake "${TARGET}" || die
}

src_install() {
	dopammod src/build/lib.*/pam_python.so

	dodoc pam_python.html
	dodoc ChangeLog.txt README.txt

	if use doc; then
		dohtml -r doc/html/*
	fi
}

src_test() {
	# FIXME
	true
}
