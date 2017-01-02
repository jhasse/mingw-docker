FROM fedora:25
RUN dnf install -y \
	mingw64-libgomp \
	mingw64-bzip2-static \
	mingw64-zlib-static \
	mingw64-libpng-static \
	mingw64-libjpeg-turbo-static \
	mingw64-libtiff-static \
	mingw64-expat-static \
	python3
ENV CXX x86_64-w64-mingw32-c++
