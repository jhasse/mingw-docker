#!/bin/bash

set -eux

dnf install -y cmake make
git clone -b translation-utf8 https://github.com/jhasse/wxWidgets
cd wxWidgets
mkdir mingw-build
cd mingw-build
cmake -DCMAKE_SYSTEM_NAME=Windows -DwxBUILD_SHARED=OFF -DwxUSE_LIBTIFF=sys \
	-DwxUSE_LIBPNG=sys -DPNG_PNG_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include -DPNG_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libpng.a \
	-DTIFF_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include -DTIFF_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libtiff.a \
	-DwxUSE_LIBJPEG=sys -DJPEG_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include -DJPEG_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libjpeg.a \
	-DwxUSE_ZLIB=sys -DZLIB_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include -DZLIB_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libz.a \
	-DwxUSE_EXPAT=sys -DEXPAT_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include -DEXPAT_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libexpat.a \
	-DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw ..
make -j$(nproc) install

dnf remove -y cmake
dnf clean all
rm -rf wxWidgets

cd /usr/x86_64-w64-mingw32/sys-root/mingw/lib/gcc_lib
mv wxmsw31u_propgrid.a libwxmsw31u_propgrid.a
mv wxmsw31u_aui.a libwxmsw31u_aui.a
mv wxmsw31u_gl.a libwxmsw31u_gl.a
mv wxmsw31u_richtext.a libwxmsw31u_richtext.a
mv wxmsw31u_stc.a libwxmsw31u_stc.a
mv wxmsw31u_xrc.a libwxmsw31u_xrc.a
mv wxmsw31u_qa.a libwxmsw31u_qa.a
mv wxbase31u_net.a libwxbase31u_net.a
mv wxmsw31u_html.a libwxmsw31u_html.a
mv wxmsw31u_adv.a libwxmsw31u_adv.a
mv wxmsw31u_core.a libwxmsw31u_core.a
mv wxbase31u_xml.a libwxbase31u_xml.a
mv wxbase31u.a libwxbase31u.a
