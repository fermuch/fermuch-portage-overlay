# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit unpacker eutils multilib

DESCRIPTION="Strife is a competitive online game that features non-stop action and thrilling combat. Take control of powerful and versatile heroes, each capable of dominating in unique ways, and exert your will in an epic battle between two teams."
HOMEPAGE="https://strife.com/"
SRC_URI="http://dl.strife.com/af1dfc2754268375727a3eec1749b27e/StrifeLinux64-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+openal +opengl +ssl"

MLIB_DEPS="amd64? (
  openal? ( app-emulation/emul-linux-x86-sdl )
  opengl? ( app-emulation/emul-linux-x86-opengl )
  media-libs/alsa-lib
  >=media-libs/freetype-2.0.0
  media-libs/mesa
)"

X86_DEPS="x86? (
  openal? ( media-libs/openal )
  opengl? (
    virtual/glu
    virtual/opengl
  )
  ssl? ( dev-libs/openssl:0 )
  media-libs/alsa-lib
  >=media-libs/freetype-2.0.0
  media-libs/mesa
)"

DEPEND=""

RDEPEND="${DEPEND}
  dev-util/desktop-file-utils
  ${MLIB_DEPS}
  ${X86_DEPS}
"

src_unpack() {
  if [ "${A}" != "" ]; then
    unpack ${A}
    S="${WORKDIR}/Strife"
  fi
}

src_install() {
  # insinto "/opt/strife"
  # newicon "icon.png"
  # newexe "bin/strife" ${PN}
  dodir "game" "bin" "base" "updater"
  dobin "ca-bundle.crt" "strife.manifest" "strife.version"
}