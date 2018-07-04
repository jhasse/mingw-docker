FROM fedora:28
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
	mingw64-gcc-gfortran \
	mingw64-openssl-static \
	mingw64-winpthreads-static \
	git \
	sshpass \
	wine-core \
	autogen \
	unzip make mingw64-qt5-qtwebkit patch cmake \
	p7zip-plugins && dnf clean all

RUN ln -s /usr/bin/x86_64-w64-mingw32-ar /usr/local/bin/ar
RUN ln -s /usr/bin/x86_64-w64-mingw32-strip /usr/local/bin/strip
RUN ln -s /usr/bin/mingw64-qmake-qt5 /usr/local/bin/qmake-qt5

ENV CC x86_64-w64-mingw32-gcc
ENV CXX x86_64-w64-mingw32-c++
ENV FC x86_64-w64-mingw32-gfortran
ENV RC x86_64-w64-mingw32-windres
ENV PKGCONFIG mingw64-pkg-config
ENV LANG en_US.UTF-8
ENV WINEPATH /usr/x86_64-w64-mingw32/sys-root/mingw/bin

# OpenBLAS
RUN curl -o /tmp/openblas.zip https://codeload.github.com/xianyi/OpenBLAS/zip/v0.3.0 && \
	pushd /tmp && unzip openblas.zip && cd OpenBLAS* && make -j16 TARGET=NEHALEM && \
	make PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw install && cd - && rm -rf OpenBLAS* && \
	rm openblas.zip
