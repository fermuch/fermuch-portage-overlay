# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils vcs-snapshot git-2 systemd

DESCRIPTION="Symlinks and syncs user specified dirs to RAM thus reducing HDD/SDD calls and speeding-up the system."
HOMEPAGE="https://wiki.archlinux.org/index.php/Anything-sync-daemon"

SRC_URI=""
EGIT_REPO_URI="https://github.com/graysky2/anything-sync-daemon.git"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="
  app-shells/bash
  net-misc/rsync
  virtual/cron"

src_install() {
  emake -j1 DESTDIR="${ED}" \
    install-systemd-all
}