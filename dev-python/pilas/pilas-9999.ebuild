# Copyright owners: Gentoo Foundation
#                   Arfrever Frehtes Taifersar Arahesis
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7} pypy )

inherit git-2 distutils-r1

DESCRIPTION="Pilas is an engine to make games fast and easy."
HOMEPAGE="http://pilas-engine.com.ar/ https://github.com/hugoruscitti/pilas"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-libs/box2d
		dev-python/setuptools
		dev-python/PyQt4[opengl,phonon]
		dev-python/pygame"
RDEPEND="${DEPEND}"

SRC_URI=""
EGIT_REPO_URI="https://github.com/hugoruscitti/pilas.git"
EGIT_HAS_SUBMODULES="Y"


python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all
}