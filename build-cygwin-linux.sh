#!/bin/bash
set -e -x
cd "$(dirname "$0")"
./configure --prefix=/usr --target=arm-apple-darwin10
make
rm -rf ./_install
DESTDIR=./_install make install
make clean
PLATFORM="linux"
if [ -f /usr/bin/cygwin1.dll ]; then
	cp /usr/bin/cygcrypto-1.0.0.dll /usr/bin/cyggcc_s-1.dll \
    /usr/bin/cygstdc++-6.dll /usr/bin/cyguuid-1.dll \
    /usr/bin/cygwin1.dll /usr/bin/cygz.dll ./_install/usr/bin/
    PLATFORM="cygwin"
fi
g++ -O2 -o ./_install/usr/bin/ldid ldid/ldid.cpp -Ildid -x c ldid/lookup2.c ldid/sha1.c
cd _install
tar zcf ../cctools-829-${PLATFORM}.tgz usr
