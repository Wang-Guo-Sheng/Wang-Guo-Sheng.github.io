---
layout: blog
istop: false
tech: true
title: "manjaro更新libcanberra破坏依赖"
background-image: "https://wiki.manjaro.org/images/e/ea/New_logo_tex.png"
date: 2021-07-16 15:51
category: 技术
tags:
- manjaro
- dependency
---

报错：

```bash
 ➜  ~ sudo pacman -Syu                  
......
错误：无法准备事务处理 (无法满足依赖关系)
:: 安装 lib32-libcanberra (0.30+2+gc0620e4-5) 破坏依赖 'lib32-libcanberra=0.30+2+gc0620e4-3' （lib32-libcanberra-gstreamer 需要）
:: 安装 libcanberra (0.30+2+gc0620e4-5) 破坏依赖 'libcanberra=0.30+2+gc0620e4-3' （libcanberra-gstreamer 需要）
:: 安装 pacman (6.0.0-1) 破坏依赖 'pacman<5.3' （package-query 需要）
```

解决：用`pamac update`更新自动解决（卸载了`libcanberra-gstreamer`等依赖「所以把`yaourt`也卸载了｛虽然本来已经不会再用它了的｝」）。

参见[这里](https://www.reddit.com/r/ManjaroLinux/comments/nzlmsy/update_problem_libcanberragstreamer/)。