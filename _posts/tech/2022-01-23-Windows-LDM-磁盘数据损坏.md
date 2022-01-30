---
layout: blog
istop: false
tech: true
title: "Windows LDM 磁盘数据损坏"
background-image: ""
date: 2022-01-23 09:12
category: 技术
tags:
- Windows
- Data
- Recovery
- LDM
---



旧硬盘放久了，原来Windows数据分区上似乎有坏区，GParted和Windows设备管理器都读不出来。GParted显示为“LDM Partition”。LDM（[Logical Disk Manager](https://www.ntfs.com/ldm.htm)）是说Windows的NTFS分区大概是有很多虚拟化的处理，用另外的动态目录来管理扇区云云。

安装`ldmtool`，先`umount`硬盘上的所有分区，然后在`ldmtool`的终端里写

```bash
ldm> create all
```

这一步提取了LDM分区的元数据。此时会返回相关分区的若干Volume名称，比如

```bash
[
  "ldm_vol_<PCNAME>-Dg0_Volume1",
  "ldm_vol_<PCNAME>-Dg0_Volume2"
]
```

这些名称就是`ldmtool`在`/dev/mapper/`下面创建的虚拟设备的名称。

```bash
/dev/mapper
├── ldm_vol_<PCNAME>-Dg0_Volume1 -> ../dm-0
└── ldm_vol_<PCNAME>-Dg0_Volume2 -> ../dm-1
```

挂载这些目录就可以读取数据了，只剩坏区所在的Volume无法挂载。

```bash
sudo mount /dev/mapper/ldm_vol_<PCNAME>-Dg0_Volume2 /run/media/<USERNAME>/Vol2/
mount: /run/media/<USERNAME>/Vol2/: 文件系统类型错误、选项错误、/dev/mapper/ldm_vol_<PCNAME>-Dg0_Volume2 上有坏超级块、缺少代码页或帮助程序或其他错误.
```

除此之外，把数据拷贝出来重新格式化即可。

## 参考

- [SE](https://unix.stackexchange.com/questions/241499/how-do-i-handle-linux-raid0-and-windows-striped-dynamic-volumes-on-the-same-set)
- [mikas](https://michael-prokop.at/blog/2013/02/18/ldmtool-accessing-microsoft-windows-dynamic-disks-from-linux/)

----

## Edit:

本来要拷到另一块磁盘上，拷到一半的时候发现那块磁盘格式化选成了FAT32，结果4GB以上文件拷不进去。这时候把前面那块硬盘拔掉重插了一次，卒，现在也找不到`ldmtool`恢复出来的`dm_0`磁盘分区索引了，再挂载mapper也没用。

折腾好久，最后还是靠傻瓜软件解决：DiskInternals Linux Reader，本来是用来在Windows上读ext分区，这次直接打开软件它就把`ldm`分区显示出来了，终于可以直接保存拷贝了。

## 小结

所以，这个旧硬盘原本是Windows系统盘，由于以前反复重装过很多遍，分区十分混乱。某一次重装的时候在Windows 10上把几个几十GB的分区合并起来，结果变成了一个跨区卷，动态磁盘，也不知道怎么转换成基本，结果就这样遗留了下来，此后硬盘上大概还有了一些坏区。Windows系统的分区越来越复杂，LDM也不开放，不进一步学它那复杂的设计的话，还是避免在Windows上调整磁盘分区为好。
