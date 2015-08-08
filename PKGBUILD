pkgname=kdeplasma-applets-updatenotifier-git
_pkgname=updatenotifier
pkgver=1.0.0
pkgrel=1
pkgdesc="Update notification plasmoid for Plasma 5."
arch=('i686' 'x86_64')
url="https://github.com/NousDev/updatenotifier"
license=('GPL')
depends=('plasma-framework')
makedepends=('git' 'extra-cmake-modules')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=('git://github.com/NousDev/updatenotifier.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_pkgname}"/build

  make install DESTDIR="${pkgdir}"
}
