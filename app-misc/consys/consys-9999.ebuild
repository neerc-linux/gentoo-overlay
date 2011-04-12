# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="3"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.*"

inherit git distutils

DESCRIPTION="A contest management system written in Python"
HOMEPAGE="http://gitorious.org/neerc-linux/consys/"
EGIT_REPO_URI="git://gitorious.org/neerc-linux/consys.git"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

