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
RDEPEND=">=dev-python/configobj-4.7.2
	>=net-zope/zope-interface-3.5.3
	>=dev-python/twisted-11.0.0
	>=dev-python/twisted-conch-11.0.0
	>=dev-python/py-notify-0.2.1
	client? (
		>=dev-python/python-daemon-1.6
		>=dev-python/pygobject-2.20.0
	)
	server? (
		>=dev-python/python-daemon-1.6
		=dev-python/twistar-9999
	)
"

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
