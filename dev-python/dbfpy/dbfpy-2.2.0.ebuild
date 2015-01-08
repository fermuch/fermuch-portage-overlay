# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pypgsql/pypgsql-2.5.ebuild,v 1.1 2006/06/03 13:06:20 lucass Exp $

inherit distutils

DESCRIPTION="Python Interface to DBF files"
HOMEPAGE="http://dbfpy.sourceforge.net/"
SRC_URI="mirror://sourceforge/dbfpy/dbfpy-${PV}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ia64 ~x86"
SLOT="0"
IUSE=""
#DEPEND=""

PYTHON_MODNAME="dbfpy"

src_install() {
	distutils_src_install

	dodoc CHANGES
}
