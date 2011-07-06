# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit distutils git-2

DESCRIPTION="A contest management system written in Python"
HOMEPAGE="http://gitorious.org/neerc-linux/consys"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/neerc-linux/consys.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+client server admin"

DEPEND=""
RDEPEND=""

DISTUTILS_SETUP_FILES=("setup-common.py")

if use client; then
	DISTUTILS_SETUP_FILES+=("setup-client.py")
fi

if use server; then
	DISTUTILS_SETUP_FILES+=("setup-server.py")
fi

if use admin; then
	DISTUTILS_SETUP_FILES+=("setup-admin.py")
fi
