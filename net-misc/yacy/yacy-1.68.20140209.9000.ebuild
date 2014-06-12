# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $HEADER: $

inherit user eutils versionator systemd

MAJOR_PV="$(get_version_component_range 1-2)"
REL_PV="$(get_version_component_range 3)"
SVN_PV="$(get_version_component_range 4)"

DESCRIPTION="YaCy - p2p based distributed web-search engine"
HOMEPAGE="http://www.yacy.de/"
SRC_URI="http://yacy.de/release/yacy_v${MAJOR_PV}_${REL_PV}_${SVN_PV}.tar.gz"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="virtual/jre"
DEPEND="${RDEPEND}
		app-admin/sudo"
LICENSE="GPL-2"

IUSE=""

S="${WORKDIR}/yacy"

src_install() {
	dodir /opt
	mv "${S}" "${D}/opt/yacy"
	chown -R yacy:yacy "${D}/opt/yacy"

	dodir /var/log/yacy || die
	chown yacy:yacy "${D}/var/log/yacy" || die
	dosym /opt/yacy/yacy.log /var/log/yacy/yacy.log || die
	# dosed "s:DATA/LOG/:/var/log/yacy/:g" "/opt/yacy/DATA/LOG/yacy.logging"

	# exeinto /etc/init.d
	# newexe "${FILESDIR}/yacy-${MAJOR_PV}.rc" yacy
	# insinto /etc/conf.d
	# newins "${FILESDIR}/yacy-${MAJOR_PV}.confd" yacy
	systemd_dounit ${FILESDIR}/yacy.service
}

pkg_setup() {
	enewgroup yacy
	enewuser yacy -1 /bin/bash /opt/yacy yacy
}

pkg_postinst() {
	einfo "yacy.logging will write logfiles into /var/log/yacy/"
	einfo "To setup YaCy, open http://localhost:8090 in your browser."
}
