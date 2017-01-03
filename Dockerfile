FROM fedora:25
RUN dnf install -y \
	mingw64-libgomp \
	mingw64-bzip2-static \
	mingw64-zlib-static \
	mingw64-libpng-static \
	mingw64-libjpeg-turbo-static \
	mingw64-libtiff-static \
	mingw64-expat-static \
	mingw64-freetype-static \
	mingw64-dlfcn \
	mingw64-boost \
	python3 \
	git \
	sshpass \
	wine-core \
	p7zip-plugins

COPY mingw64-wxWidgets-3.1.0-20.fc25.noarch.rpm /tmp/
COPY mingw64-wxWidgets-static-3.1.0-20.fc25.noarch.rpm /tmp/
RUN dnf install -y /tmp/mingw64-wxWidgets-*.rpm

RUN ln -s /usr/bin/x86_64-w64-mingw32-ar /usr/local/bin/ar
ENV CXX x86_64-w64-mingw32-c++

ENV LANG C.UTF-8
