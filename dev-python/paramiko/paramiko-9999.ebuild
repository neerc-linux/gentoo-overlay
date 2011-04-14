# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit git distutils eutils

DESCRIPTION="SSH2 protocol library fork"
HOMEPAGE="http://github.com/himikof/paramiko/"
EGIT_REPO_URI="git://github.com/himikof/paramiko.git"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc examples"

RDEPEND=">=dev-python/pycrypto-1.9_alpha6"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_test() {
	testing() {
		"$(PYTHON)" test.py --verbose
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/* || die "dohtml failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r demos || die "doins failed"
	fi
}
