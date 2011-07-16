# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit distutils git-2 eutils

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


pkg_setup() {
	enewgroup consys
	enewuser consys -1 -1 /etc/consys consys
}

src_install() {
	distutils_src_install

	insinto /etc/consys
	doins "${FILESDIR}"/consys.conf || die
	dodir /etc/consys/keys || die
	fowners root:consys /etc/consys /etc/consys/keys /etc/consys/consys.conf
	fperms 0750 /etc/consys /etc/consys/keys
	fperms 0640 /etc/consys/consys.conf

	dodir /var/lib/consys || die
	fowners root:consys /var/lib/consys
	fperms 0770 /var/lib/consys
	if use server; then
		if [ ! -e /var/lib/consys/server.db ]; then
			sqlite3 "${D}"/var/lib/consys/server.db < "${S}"/server.sql || die
			fowners root:consys /var/lib/consys/server.db
			fperms 0660 /var/lib/consys/server.db
		fi
	fi

	dodir /var/{log,run}/consys || die
	fowners root:consys /var/{log,run}/consys
	fperms 0770 /var/{log,run}/consys

	newinitd "${FILESDIR}"/consys.initd consys || die
	newconfd "${FILESDIR}"/consys.confd consys || die

	if use server; then
		dosym /etc/init.d/consys /etc/init.d/consys.server
	fi
	if use client; then
		dosym /etc/init.d/consys /etc/init.d/consys.client
	fi
}
