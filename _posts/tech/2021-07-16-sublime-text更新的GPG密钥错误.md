---
layout: blog
istop: false
tech: true
title: "sublime-text更新的GPG密钥错误"
background-image: "https://www.sublimetext.com/images/logo.svg"
date: 2021-07-16 15:47
category: 技术
tags:
- GPG
- sublime-text
---

很久没有更新，Sublime Text的密钥又错了。

报错：

```bash
➜  ~ sudo pacman -U sublime-text   
错误：sublime-text: 密钥 "F57D4F59BD3DF454" 未知
:: 是否导入 PGP 公钥 F57D4F59BD3DF454 ？ [Y/n] y
错误：无法远程查找到密钥 "F57D4F59BD3DF454"
错误：数据库 'sublime-text' 无效 (无效或已损坏的数据库 (PGP 签名))
正在加载软件包...
错误：'sublime-text': 无法找到或读取软件包
```

解决：

```bash
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
sudo pacman -U sublime-text
```

参见[这里](https://archived.forum.manjaro.org/t/sublime-text-3-gpg-key-error/33688/3)。