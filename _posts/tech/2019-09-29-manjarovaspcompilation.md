---
layout: blog
istop: false
tech: true
title: "Manjaro 系统 VASP 编译简记"
background-image: https://cmp.univie.ac.at/fileadmin/_processed_/csm_vasp_logo_3956c6ee63.png
date: 2019-09-29
category: 技术
tags:
- linux
- vasp
- ifort
- gcc
---

编译于2019年9月23日，VASP版本5.4.4。根据[sobereva](http://sobereva.com/455)给出的CentOS7上的编译过程改写，请参考原帖。

## 安装 Intel 编译器

下载的版本是 parallel_studio_xe_2019_update1_cluster_edition.tgz 。解压后运行 install_GUI.sh 开始安装；选择模块时要取消勾选提及图形界面或32位系统的模块，避免难以满足的依赖关系，并取消勾选其它与 VASP 编译无关的大组件。

必要组件：

* Intel Fortran Compiler
* Intel C++ Compiler
* Intel Math Kernel Library 2019 Update 1 for Fortran
  * Intel MKL core libraries for Fortran、Fortran 95 interfaces for BLAS and LAPACK、Cluster support for Fortran
* Intel Math Kernel Library 2019 Update 1 for C/C++
  * Intel MKL core libraries for C/C++、Cluster support for C/C++
* Intel MPI Library 2019 Update 1
  * Intel MPI Library for applications...
* Intel Threading Building Blocks 2019

完成安装后，在`~/.bashrc`末添加：

```bash
source <编译器安装路径>/intel/parallel_studio_xe_2019/psxevars.sh
```

## 安装 gcc7

编译过程需要的 gcc 版本与 manjaro 预装的（gcc9）不同，故需先从 AUR 安装 gcc7 ，并暂时把它设为默认的 gcc 版本：

```bash
yaourt -S gcc7
sudo ln -s $(which gcc-7) /usr/local/bin/gcc
sudo ln -s $(which g++-7) /usr/local/bin/g++
hash -r
```

## 将 gcc7 的标准库拷贝到合适的位置

```bash
sudo cp -r /usr/lib/gcc/x86-pc-linux-gnu/7.4.1/include/c++/usr/include/c++ /usr/include/c++/7.4.1
```

## 编译

在已解压的 VASP 安装包目录下把 arch/makefile.include.linux_intel 拷到上一级目录，改名为 makefile.include ，打开此文件，在`OFLAG`行末加上选项`-xhost`。执行`make all`即可。可在`~/.bashrc`中把编译得到的文件添加到环境变量：

```bash
export PATH="$PATH:<vasp安装路径>/vasp.5.4.4/bin"
```

此时`vasp_std`，`vasp_gam`，`vasp_ncl`三个命令已经可以执行。选择一些输入文件，运行

```bash
mpirun -np <使用核数> vasp_std
```

验证运行和输出文件情况。

## 恢复 gcc9 的默认地位

删去生成的两个链接后重记软件位置即可：

```bash
sudo rm /usr/local/bin/gcc /usr/local/bin/g++
hash -r
```

