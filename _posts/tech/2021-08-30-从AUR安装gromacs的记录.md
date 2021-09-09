---
layout: blog
istop: false
tech: true
title: "从AUR安装gromacs的记录"
background-image: "http://www.gromacs.org/@api/deki/site/logo.png"
date: 2021-08-30 15:48
category: 技术
tags:
- aur
- yay
- installation
- gromacs
- proxy
---

先用yay安装vmd。此前需要自己在[UIUC网站](https://www.ks.uiuc.edu/Research/vmd/vmd-1.9.4/files/alpha/vmd-1.9.4a51.bin.LINUXAMD64-CUDA102-OptiX650-OSPRay185.opengl.tar.gz)下载压缩包放到`~/.cache/yay/vmd/`下。下载卡了一夜，第二天换了个美国的代理，完成。

yay安装gromacs（2021.2），直接`yay -S`拿到的AUR里的PKGBUILD在编译fftw的时候会出错，avx2选项重复了（先`grep avx2 /proc/cpuinfo`查看是否支持avx2），需要`yay --editmenu -S`修改PKGBUILD，[直接在`options`中添加`!buildflags`关闭这些选项即可](https://bbs.archlinux.org/viewtopic.php?pid=1870450#p1870450)。

这以后，安装完成前`make check`测试报错`58 - MdrunNonIntegratorTests (Failed)`，提示LAPACK矩阵对角化错误。

重新安装时AUR更新到2021.3了。试了一下，同样需要添加`!buildflags`。测试报错一样。

[`cmake`加个选项`-DGMX_EXTERNAL_BLAS=TRUE`。](https://gromacs.bioexcel.eu/t/gromacs-2020-2-install-error/404/3)没有变化。

最后放弃了双精度部分，只编译单精度，过了。打开CUDA加速。

> [如果模拟刚开始就崩溃，有时候用双精度版本可解决，但计算比单精度版慢将近一倍、trr/edr等文件体积大一倍。另外，做正则振动分析时在能量极小化和对角化Hessian矩阵的时候一般也需要用双精度版以确保数值精度。](http://sobereva.com/457)

最后通过的PKGBUILD：

```makefile
# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs
pkgver=2021.3
pkgrel=1
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=("LGPL")
arch=('x86_64')
depends=('lapack' 'zlib' 'hwloc' 'gcc10')
optdepends=('cuda: Nvidia GPU support'
            'vmd: Accesibility to other trajectory formats (ONLY WHEN COMPILING)'
            'perl: needed for demux.pl and xplor2gmx.pl'
	    'opencl-mesa: OpenCL support for AMD GPU'
	    'opencl-nvidia: OpenCL support for Nvidia GPU')
makedepends=('cmake' 'libxml2' 'hwloc')
options=('!libtool' '!buildflags')
source=(http://ftp.gromacs.org/pub/gromacs/gromacs-${pkgver}.tar.gz)
sha256sums=('e109856ec444768dfbde41f3059e3123abdb8fe56ca33b1a83f31ed4575a1cc6')

export VMDDIR=/usr/lib/vmd/ #If vmd is available at compilation time
                            #Gromacs will have the ability to read any
                            #trajectory file format that can be read by
                            #VMD installation (e.g. AMBER's DCD format).

#For cuda support gcc10 is required, if you do not need cuda support comment the next two lines and install cuda
#export CC=gcc-10
#export CXX=g++-10 

build() {
  mkdir -p ${srcdir}/{single,double}

 
#  msg2 "Building the double precision files"
#  cd ${srcdir}/double	
#  cmake ../gromacs-${pkgver}/ \
#        -DCMAKE_INSTALL_PREFIX=/usr \
#        -DCMAKE_INSTALL_LIBDIR=lib \
#        -DGMX_DOUBLE=ON \
#        -DGMX_BUILD_OWN_FFTW=ON \
#        -DREGRESSIONTEST_DOWNLOAD=ON
#  make

  msg2 "Building the single precision files"
  cd ${srcdir}/single
  cmake ../gromacs-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_INSTALL_LIBDIR=lib\
        -DGMX_BUILD_OWN_FFTW=ON \
        -DREGRESSIONTEST_DOWNLOAD=ON \
        -DGMX_EXTERNAL_BLAS=ON \
        -DGMX_FFT_LIBRARY=fftw3 \
        -DGMX_GPU=CUDA
  #GMX_GPU: Framework for GPU acceleration. Pick one of: OFF, CUDA, OpenCL, SYCL
  # -DGMX_GPU=CUDA \
  make
}

check () {
#  msg2 "Testing double precision compilation"
#  cd ${srcdir}/double
#  make check
  msg2 "Testing single precision compilation"
  cd ${srcdir}/single
  make check
}

package() {

  msg2 "Making the single precision executables"
  cd ${srcdir}/single
  make  DESTDIR=${pkgdir} install

  # Cleaning up, kept the csh completion at default location
#  msg2 "Making the double precision executables"
#  cd ${srcdir}/double
#  make DESTDIR=${pkgdir} install

  # installing completions in correct location and environment setup script
  msg2 "Installing completion and environment setup script"
  mkdir -p ${pkgdir}/etc/profile.d/
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
  install -D -m755 ${srcdir}/gromacs-${pkgver}/src/programs/completion/gmx-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gromacs"
  mv ${pkgdir}/usr/bin/GMXRC.* ${pkgdir}/etc/profile.d/
  sed "s:/usr/bin:/etc/profile.d:" ${pkgdir}/usr/bin/GMXRC > ${pkgdir}/etc/profile.d/GMXRC
  chmod 755 ${pkgdir}/etc/profile.d/GMXRC
  rm -f ${pkgdir}/usr/bin/completion.*
  rm -f ${pkgdir}/usr/bin/GMXRC
}

```

