# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* *-jython"

inherit git distutils eutils

DESCRIPTION="Asyncronous ORM library for Twisted"
HOMEPAGE="http://findingscience.com/twistar"
EGIT_REPO_URI="git://github.com/bmuller/twistar.git"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc examples"

RDEPEND=">=dev-python/twisted-10.2.0"
DEPEND="${RDEPEND}
	dev-python/setuptools"

