export FRIDA_HOST=mac-i386

#rm -rf build/fs-mac-i386
#rm -rf build/fs-sdk-mac-i386
#rm -rf build/fs-tmp-mac-i386

rm -rf build/.fs-sdk-mac-i386-stamp
rm -rf build/sdk-mac-i386.tar.bz2
rm -rf build/.glib-stamp
rm -rf build/fs*.site
rm -rf build/fs*.rc
rm -rf build/fs*386*

make -f Makefile.sdk.mk
