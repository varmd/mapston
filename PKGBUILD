#Copyright (C) 2020 varmd (https://github.com/varmd)

export LANG=en_US.utf8
LANG=en_US.utf8
pkgname=mapston
pkgver=1.2
pkgrel=1
pkgdesc='Offline OpenStreetMap maps - patched to work with wayland and archlinux'
arch=(x86_64)
url='https://maps.me/en/home'
license=(Apache)
depends=(qt6-base qt6-wayland boost-libs protobuf)
makedepends=(cmake ninja vulkan-headers boost)

source=(
  "https://github.com/organicmaps/organicmaps/archive/4fd7d5ebcb94b10232df03a5f63f81bffa685fbc.zip"
  "https://github.com/mapsme/just_gtfs/raw/d8510d0a4e9893a9ff6fc0521477773fdf991905/just_gtfs.h"
  "https://github.com/g-truc/glm/archive/c834d06c2739f63e28e5665d4569dca9415e3891.zip"
  "https://github.com/lemire/fast_double_parser/archive/111ad8041765d1623195bd6eb8b6bc7d97c44507.zip"
  "https://github.com/mapsme/protobuf/archive/a6189acd18b00611c1dc7042299ad75486f08a1a.zip"
  )


sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {


  #if [ -e "${srcdir}/omim-release-$pkgver" ]; then
    #echo "Already configured"
  #else

    #use archlinux boost
    rm -rf *.zip
    mv organic* mapston

    cd mapston

    rm -rf android xcode iphone qt_* skin_generator packaging
    msg2 "patching wayland support"
    patch -Np1 < ../../patches/0000-fix-wayland-new-1.patch



    msg2 "patching wayland popup support"
    patch -Np1 < ../../patches/0001-Fix-popups-for-wayland-and-add-screenshot.patch



    msg2 "patching wayland font sizes"
    patch -Np1 < ../../patches/0001-Increase-font-sizes-move-dock-to-right-attempt-to-di.patch

    msg2 "show all maps"
    patch -Np1 < ../../patches/fix-6-show-all-maps.patch
    msg2 "disable certificate check"
    patch -Np1 < ../../patches/disable-cert-check.patch


    msg2 "fix expat and skin_generator"
    patch -Np1 < ../../patches/fix-11-remove-expat-skin_generator.patch


    #msg2 "fix relative urls fix"
    #patch -Np1 < ../../patches/fix-10-relative-urls.patch



    msg2 "Add keyboard scrolling"
    patch -Np1 < ../../patches/fix-14-add-keyboard-scrolling.patch


    msg2 "update to qt6 1"
    patch -Np1 < ../../patches/qt6/fix-12-upgrade-to-qt-6.patch
    msg2 "update to qt6 2"
    patch -Np1 < ../../patches/qt6/fix-13-upgrade-to-qt-6-1.patch
    msg2 "update to qt6 3"
    patch -Np1 < ../../patches/qt6/fix14-upgrade-qt6.patch



    echo "" > openlr/openlr_match_quality/CMakeLists.txt
    echo "" > search/search_quality/assessment_tool/CMakeLists.txt
    echo "" > search/search_quality/CMakeLists.txt
    echo "" > search/search_tests/CMakeLists.txt
    echo "echo 2022-1" > tools/unix/version.sh


    cp private_default.h private.h
    mkdir -p 3party/expat/expat
    mkdir -p 3party/expat/expat/lib/
    cp /usr/include/expat.h 3party/expat/expat/lib/


    #cp routing_common/car_model_coefs_default.hpp routing_common/car_model_coefs.hpp


    cd 3party



    cd protobuf


    cp -r $srcdir/protobuf-a6*/* protobuf/
    cd ..


    ln -s /usr/include/boost/ $PWD/boost/boost


    cp $srcdir/just_gtfs.h just_gtfs/just_gtfs.h
    mv $srcdir/glm-c8*/* glm/
    mv $srcdir/fast*/* fast_double_parser/


    cd $srcdir
    cd ..
    rm -rf  "${srcdir}"/mapston/qt
    ln -s $PWD/qt "${srcdir}"/mapston/qt


  #fi
}


build() {
  cd mapston


  mkdir -p build
  cd build
  cmake -DSKIP_TESTS=1 -GNinja ..
  ninja -j7
}

package() {
  export PKGEXT='.pkg.tar.zst'
  cd mapston

  mkdir -p ${pkgdir}/usr/lib/mapston
  mkdir -p ${pkgdir}/usr/lib/mapston/resources
  cp -r build/OMaps* ${pkgdir}/usr/lib/mapston/

  rm -rf  ${pkgdir}/usr/lib/mapston/OMaps.app/Contents/Resources/shaders_compiler/linux/mali_compiler_es3


  mv  ${pkgdir}/usr/lib/mapston/OMaps.app/Contents/Resources/* ${pkgdir}/usr/lib/mapston/resources/
  install -Dm755 ../../start.sh "$pkgdir"/usr/bin/mapston
  install -Dm755 ../../mapston.desktop "$pkgdir"/usr/share/applications/mapston.desktop
  install -Dm744 ../../find-location-symbolic.svg "$pkgdir"/usr/lib/mapston/find-location-symbolic.svg
}
