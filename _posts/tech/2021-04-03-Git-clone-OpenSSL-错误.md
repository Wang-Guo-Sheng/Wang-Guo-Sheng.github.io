---
layout: blog
istop: false
tech: true
title: "Git clone OpenSSL 错误"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/225px-Tux.svg.png
date: 2021-04-03 03:57
category: 技术
tags:
- yay
- aur
- git
- cert
---

更新 `yay` 时报错

```bash
fatal: 无法访问 'https://aur.archlinux.org/linuxqq.git/'：OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to aur.archlinux.org:443
```

通过 `pacman -S ca-certificates` 重新安装`ca-certificates` 即可正常克隆。

> Could be a missing cert.  Try reinstalling `ca-certificates` to see if something wasn't broken there.
> [archlinux bbs](https://bbs.archlinux.org/viewtopic.php?id=256105)