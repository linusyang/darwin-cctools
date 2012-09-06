Darwin cctools with ldid
========
Ported to **Cygwin**, **iOS** and **Linux**

Forked from **gh2o** 
*Saurik's ldid* is modified by **rpetrich** 
Ported to Cygwin and iOS by **Linus Yang** <laokongzi@gmail.com>

##Usage
###Pre-requisite
You may need **OpenSSL** and **UUID** support.
* For Cygwin, install openssl-devel and libuuid-devel.
* For Linux (Debian), use APT to install libssl-dev and uuid-dev.
* For iOS, it is already contained.

###Cygwin/Linux
    ./build-cygwin-linux.sh

###iOS
    ./build-ios.sh

*Note:* 
*You may need Xcode with iOS SDK or iOS toolchain.* 
*You should specify the version and path of SDK in the script.* 

###Products
After running script, there will be a tarball with 
built binaries named *cctools-829-PLATFORM.tgz*.

**Note: cctools version is 829, and is compatible with armv7.**
