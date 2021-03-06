# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/htmlview/Attic/htmlview-3.0.0.ebuild,v 1.3 2011/01/25 17:36:13 darkside dead $

inherit rpm

IUSE=""

RH_EXTRAVERSION="8"

DESCRIPTION="A script which calls an installed HTML viewer."
HOMEPAGE="http://www.redhat.com"
SRC_URI="mirror://fedora/development/SRPMS/${P}-${RH_EXTRAVERSION}.src.rpm"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~ppc ~x86"

S=${WORKDIR}

src_compile() {
	sed -i -e '{ /^TERMS_GENERIC/s:"\(.*\)":"\1 /usr/bin/aterm /usr/bin/hanterm /usr/bin/kterm /usr/bin/mlterm /usr/bin/mrxvt /usr/bin/urxvt":
		/^TTYBROWSERS/s:"\(.*\)":"\1 /usr/bin/elinks":
		/^X11BROWSERS_GNOME/s:"\(.*\)":"\1 /usr/bin/kazehakase":
		/^X11BROWSERS_GENERIC/s:"\(.*\)":"\1 /usr/bin/firefox":
		}' htmlview || die
}

src_install () {
	dobin htmlview
	dobin launchmail
}
