export FRIDA_HOST=mac-i386

rm -rf build/frida-gum-submodule-stamp
rm -rf build/sdk-mac-i386
rm -rf build/sdk-mac-x86_64

make -f Makefile.mac.mk frida-gum/configure
make -f Makefile.mac.mk frida-gum
