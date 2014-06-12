# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit eutils fdo-mime gnome2-utils

MY_PN="${PN/jd/JD}"

DESCRIPTION="JDownloader is an opensource download software that simplifies downloading files from most One-Click-Hosters (like RS, MU, etc)."
HOMEPAGE="http://jdownloader.org"
SRC_URI="http://94.23.204.158/${MY_PN}.zip"
S=${WORKDIR}/${MY_PN}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}
	>=virtual/jre-1.5"

src_install() {
	insinto /opt/${PN}
	doins -r ${S}/*
	#fowners nobody:users -R /opt/${PN}
	#fperms g+rw -R /opt/${PN}
	dobin ${FILESDIR}/jDownloader
	newicon jd/img/logo/jd_logo_64_64.png ${PN}.png
	make_desktop_entry jDownloader ${MY_PN} ${PN} "Network;FileTransfer;P2P;GTK"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
