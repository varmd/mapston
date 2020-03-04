#Copyright (C) 2020 varmd (https://github.com/varmd)

export LANG=en_US.utf8
LANG=en_US.utf8
pkgname=maps-mew
pkgver=95
pkgrel=1
pkgdesc='Offline OpenStreetMap maps - patched to work with wayland and archlinux'
arch=(x86_64)
url='https://maps.me/en/home'
license=(Apache)
depends=(qt5-base qt5-svg qt5-wayland boost-libs)
makedepends=(cmake clang git ninja vulkan-headers boost)
source=("https://github.com/mapsme/omim/archive/release-$pkgver.zip")
sha256sums=('SKIP')

prepare() {
  
  
  #if [ -e "${srcdir}/omim-release-$pkgver" ]; then 
    #echo "Already configured"
  #else
    
    #use archlinux boost
    
    cd omim-release-$pkgver
    
    rm -rf android xcode iphone
    patch --verbose -Np1 < ../../fix-wayland-3.patch
    patch -Np1 < ../../0001-Fix-popups-for-wayland-and-add-screenshot.patch
    patch -Np1 < ../../0001-Increase-font-sizes-move-dock-to-right-attempt-to-di.patch
    
    patch -Np1 < ../../remove-bundled-boost.patch
    
    patch -Np1 < ../../fix-5.patch
    patch -Np1 < ../../donot-show-dialog.patch
    patch -Np1 < ../../fix-6-show-all-maps.patch
    patch -Np1 < ../../disable-cert-check.patch
    
    cp private_default.h private.h
    cp routing_common/car_model_coefs_default.hpp routing_common/car_model_coefs.hpp
    
    
    cd 3party
    rm -rf Alohalytics
    curl -L https://github.com/mapsme/Alohalytics/archive/0.1.4.zip > Alohalytics.zip
    unzip Alohalytics.zip
    mv Alohalytics-0.1.4/ Alohalytics
    
    cd protobuf
    rm -rf protobuf
    curl -L https://github.com/mapsme/protobuf/archive/a6189acd18b00611c1dc7042299ad75486f08a1a.zip > protobuf.zip
    unzip protobuf.zip
    mv protobuf-a6* protobuf
    
    cd ..
    ln -s /usr/include/boost/ $PWD/boost/boost
  
  #fi
}


build() {
  cd omim-release-95
  
  cd $srcdir/omim-release-95
  
  mkdir -p build
  cd build
  cmake -DSKIP_TESTS=1 -GNinja ..
  ninja
}

package() {
  export PKGEXT='.pkg.tar.zst'
  cd omim-release-95/build
  
  mkdir -p ${pkgdir}/usr/lib/omim
  mkdir -p ${pkgdir}/usr/lib/omim/resources
  cp -r MAPS.ME* ${pkgdir}/usr/lib/omim/
  rm -rf  ${pkgdir}/usr/lib/omim/MAPS.ME.app/Contents/Resources/shaders_compiler/linux/mali_compiler_es3
  mv  ${pkgdir}/usr/lib/omim/MAPS.ME.app/Contents/Resources/* ${pkgdir}/usr/lib/omim/resources/
  install -Dm755 ../../../start.sh "$pkgdir"/usr/bin/omim
  install -Dm755 ../../../omim.desktop "$pkgdir"/usr/share/applications/omim.desktop
  install -Dm744 ../../../find-location-symbolic.svg "$pkgdir"/usr/lib/omim/find-location-symbolic.svg
}
