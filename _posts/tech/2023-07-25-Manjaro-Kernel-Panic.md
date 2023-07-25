---
layout: blog
istop: false
tech: true
title: "Manjaro Kernel Panic"
background-image: ""
date: 2023-07-25 14:45
category: 技术
tags:
- update
- error
- linux
- kernel
---

After an update my manjaro system wouldn't boot after showing the following error messages:

```bash
PSS], AE_ALREADY_EXISTS (20190816/dswload2-326)
ACPI Error: AE_ALREADY_EXISTS, during name lookup/catalog (20190816/psobject-220)
ACPI BIOS Error (bug): Failure creating named object [\_PR.CPUB.PSDF1] (AE_ALREADY_EXISTS) (20190816/dswload2-326)
……
platform MSFT0101:00: failed to claim resource 1: [mem 0xfec40000-0xfed40fff]
acpi MSFT0101:00 platform device creation failed: -16
Initramfs unpacking failed: invalid magic at start of compressed archive
Kernel panic - not syncing: UFS: Unable to mount root fs on unknown-block(0,0)
CPU: 1 PID: 1 Comm: swapper/0 Not tainted: 5.4.249-1-MANJARO #1
Hardware name: Lenovo BIOS-Lenovo ideapad 700-15ISK / BIOS: ECN52UM 04/28/2016
Call Trace:
dump-stack=0x64/0x7c
panic=0x11a/0xeee
mount-block-root=0x2b2/0x382 prepare-namespace=0x136/0x16c
rest-init=0xbf/0xbf kernel-init=0x6a/0x101
ret-from-fork=0x1f/0x400
Kernel Offset: 0x38000000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000 and 0xffffffff)
---[end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)]---

```

This is usually solved by regenerating `initramfs`,  for me it turns out to be a result from an outdated kernel. 

After chroot into the system with

```bash
     sudo mount /dev/nvme0n1p1 /mnt/nv1
     sudo mount -t proc /proc /mnt/nv1/proc/
     sudo mount -t sysfs /sys /mnt/nv1/sys/
     sudo mount --rbind /dev /mnt/nv1/dev/
     sudo mount --rbind /run /mnt/nv1/run/
     sudo mount --rbind /sys/firmware/efi/efivars /mnt/nv1/sys/firmware/efi/efivars
     sudo chroot /mnt/nv1
```

I tried to regenerate `initramfs`  with `mkinitcpio -p linux54`, which finished successfully but did not eliminate the problem. 

Updating the kernel with `mhwd-kernel -i linux510`  was encountered with a "target not found" error. Then I tried installing a newer kernel with `pacman -S linux510`  and the system now boots normally.
