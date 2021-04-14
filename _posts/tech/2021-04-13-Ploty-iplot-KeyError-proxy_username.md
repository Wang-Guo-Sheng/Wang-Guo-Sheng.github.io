---
layout: blog
istop: false
tech: true
title: "Ploty iplot KeyError: proxy_username"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/225px-Tux.svg.png
date: 2021-04-13 21:05
category: 技术
tags:
- python
- plotly
---

新装的plotly使用`iplot`方法时报错：

`KeyError: proxy_username`

来自

`proxy_auth = basic_auth(creds["proxy_username"], creds["proxy_password"])`

配置文件中没有这两项，而`utils.py`中仍然调用了，在配置文件`~/.plotly/.credentials`中手动添加成两项空字符串即可

```json
￼￼    "proxy_username": "",
    "proxy_password": ""
```
￼￼