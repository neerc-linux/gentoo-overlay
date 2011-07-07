# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit git eutils

DESCRIPTION="It backs things up based on the git packfile format"
HOMEPAGE="http://github.com/apenwarr/bup"
EGIT_REPO_URI="git://github.com/apenwarr/bup"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+doc"

DEPEND="|| (
			dev-lang/python:2.4
			dev-lang/python:2.5
			dev-lang/python:2.6
			dev-lang/python:2.7
		)
		dev-vcs/git
		app-arch/par2cmdline
		dev-python/fuse-python
		doc? ( app-text/pandoc )"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"

	dodoc "${D}/usr/share/doc/${PN}"/* && rm -r "${D}/usr/share/doc/${PN}/"

	dodoc README DESIGN
}

src_test() {
	emake test || die "emake test failed"
}
