#!/bin/bash
set -e -x
cd "$(dirname "$0")"
tar zxf prelib.tgz
IOSVER="4.2"
PREFIX="/Developer"
if [ -n "$(which xcode-select)" ]; then
	PREFIX="$(xcode-select -print-path)"
fi
export DEVROOT="${PREFIX}/Platforms/iPhoneOS.platform/Developer"
export SDKROOT="${DEVROOT}/SDKs/iPhoneOS${IOSVER}.sdk"
CC="${DEVROOT}/usr/bin/gcc" CXX="${DEVROOT}/usr/bin/g++" \
LD="${DEVROOT}/usr/bin/ld" CPP="/usr/bin/cpp" \
CFLAGS="-arch armv6 -I${SDKROOT}/usr/include -I./prelib/usr/include -isysroot ${SDKROOT}" \
LDFLAGS="-miphoneos-version-min=3.0 -L${SDKROOT}/usr/lib -L./prelib/usr/lib -isysroot ${SDKROOT}" \
CXXFLAGS="${CFLAGS}" ./configure --prefix=/usr --target=arm-apple-darwin10 --host=arm-apple-darwin10
make
rm -rf ./_install
DESTDIR=./_install make install
make clean
g++ -O2 -o ./ldid-host ldid/ldid.cpp -Ildid -x c ldid/lookup2.c ldid/sha1.c
${DEVROOT}/usr/bin/g++ -O2 -arch armv6 -o ./_install/usr/bin/ldid ldid/ldid.cpp -isysroot "${SDKROOT}" -miphoneos-version-min=3.0 -L"${SDKROOT}/usr/lib" -I"${SDKROOT}/usr/include" -Ildid -x c ldid/lookup2.c ldid/sha1.c
export CODESIGN_ALLOCATE="${DEVROOT}/usr/bin/codesign_allocate"
for i in ./_install/usr/bin/*; do ./ldid-host -S $i; done;
rm -rf ./prelib ./ldid-host
cd _install
tar zcf ../cctools-829-arm-darwin.tgz usr
