#Copyright (C) 2020 varmd (https://github.com/varmd)

export LANG=en_US.utf8
LANG=en_US.utf8
pkgname=mapston
pkgver=1
pkgrel=1
pkgdesc='Mapston - Offline MapsWithMe - patched to work with wayland and archlinux'
arch=(x86_64)
url='https://maps.me/en/home'
license=(Apache)
depends=(qt5-base qt5-wayland boost-libs)
makedepends=(cmake ninja vulkan-headers boost)

#source=("https://github.com/mapsme/omim/archive/release-$pkgver.zip")
#source=("https://github.com/omapsapp/omapsapp/commit/669a604bb6d165e56226404426ad8abbfb98c274")
source=("https://github.com/mapsme/omim/archive/90427d18137c7db18134457a17b91467450b7afe.zip")

sha256sums=('SKIP')

prepare() {
  
  
  #if [ -e "${srcdir}/omim-release-$pkgver" ]; then 
    #echo "Already configured"
  #else
    
    #use archlinux boost
    
    cd omim-*
    
    rm -rf android xcode iphone qt_* skin_generator packaging
    msg2 "patching wayland support"
    patch -Np1 < ../../patches/fix-wayland-new-1.patch
    
    msg2 "patching wayland popup support"
    patch -Np1 < ../../patches/0001-Fix-popups-for-wayland-and-add-screenshot.patch
    
    msg2 "patching wayland font sizes"
    patch -Np1 < ../../patches/0001-Increase-font-sizes-move-dock-to-right-attempt-to-di.patch
    
    msg2 "remove bundled boost"
    patch -Np1 < ../../patches/remove-bundled-boost.patch
    
    msg2 "fix 5"
    patch -Np1 < ../../patches/fix-5.patch
    
    msg2 "do not show dialog patch"
    patch -Np1 < ../../patches/donot-show-dialog.patch
    
    patch -Np1 < ../../patches/fix-6-show-all-maps.patch
    patch -Np1 < ../../patches/disable-cert-check.patch
    
    msg2 "fix vulkan headers and intel gles"
    patch -Np1 < ../../patches/fix-7-vulkan-headers.patch
    patch -Np1 < ../../patches/fix-8-intel-gles.patch
    
    msg2 "disabling animations to fix wayland"
    patch -Np1 < ../../patches/disable-animations-that-hang-wayland.patch
    
    
    msg2 "fix expat and skin_generator"
    patch -Np1 < ../../patches/fix-11-remove-expat-skin_generator.patch
    
    
    msg2 "fix relative urls fix"
    patch -Np1 < ../../patches/fix-10-relative-urls.patch
    
    
    msg2 "Remove Qt5svg"
    #disable for qt5
    patch -Np1 < ../../patches/fix-13-remove-qt5svg.patch
    
    msg2 "update to qt6"
    #disable for now
    #patch -Np1 < ../../patches/fix-12-upgrade-to-qt-6.patch
    #patch -Np1 < ../../patches/fix-13-upgrade-to-qt-6-1.patch
    
    
    
    echo "" > openlr/openlr_match_quality/CMakeLists.txt    
    echo "" > search/search_quality/assessment_tool/CMakeLists.txt
    
    
    cp private_default.h private.h
    mkdir -p 3party/expat/expat
    mkdir -p 3party/expat/expat/lib/
    cp /usr/include/expat.h 3party/expat/expat/lib/
    
    
    cp routing_common/car_model_coefs_default.hpp routing_common/car_model_coefs.hpp
    
    rm -rf 3party/Alohalytics
    msg2 "fix Alohalytics"
    cp -r ../../patches/Alohalytics 3party/
    
    cd 3party
    
    cd protobuf
    rm -rf protobuf
    curl -L https://github.com/mapsme/protobuf/archive/a6189acd18b00611c1dc7042299ad75486f08a1a.zip > protobuf.zip
    unzip protobuf.zip
    mv protobuf-a6* protobuf
    
    cd ..
    ln -s /usr/include/boost/ $PWD/boost/boost
    
    curl -L https://github.com/mapsme/just_gtfs/raw/d8510d0a4e9893a9ff6fc0521477773fdf991905/just_gtfs.h > just_gtfs/just_gtfs.h
  
  #fi
}


build() {
  cd omim-*
  
  
  mkdir -p build
  cd build
  cmake -DSKIP_TESTS=1 -GNinja ..
  ninja -j7
}

package() {
  export PKGEXT='.pkg.tar.zst'
  cd omim-*
  
  mkdir -p ${pkgdir}/usr/lib/omim
  mkdir -p ${pkgdir}/usr/lib/omim/resources
  cp -r build/MAPS.ME* ${pkgdir}/usr/lib/omim/
  rm -rf  ${pkgdir}/usr/lib/omim/MAPS.ME.app/Contents/Resources/shaders_compiler/linux/mali_compiler_es3
  
  
  mv  ${pkgdir}/usr/lib/omim/MAPS.ME.app/Contents/Resources/* ${pkgdir}/usr/lib/omim/resources/
  install -Dm755 ../../start.sh "$pkgdir"/usr/bin/mapston
  install -Dm755 ../../mapston.desktop "$pkgdir"/usr/share/applications/mapston.desktop
  install -Dm744 ../../find-location-symbolic.svg "$pkgdir"/usr/lib/omim/find-location-symbolic.svg
}
