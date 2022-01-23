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

