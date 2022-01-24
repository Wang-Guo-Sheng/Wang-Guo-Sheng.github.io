---
layout: blog
istop: false
book: true
title: "用Linux Wifi 热点分享SOCKS代理的路由设置"
background-image: ""
date: 2021-12-16 14:42
category: 技术
tags:
- linux
- proxy
- socks5
- clash
- hotspot
- redsocks
- iptables
- routing
---

## 设置热点

- PC连接到Wifi；在PC上用[`linux-wifi-hotspot`](https://github.com/lakinduakash/linux-wifi-hotspot)设置一个Wifi热点连接点，手机连接到热点，测试到无需代理的网站的连接。
- 用`ip link show`查看热点的网络接口名称。

$$
\text{Internet}\xrightarrow{\text{wlp2s0}}\text{PC}\xrightarrow{\text{ap0}}\text{Hotspot}
$$

- PC打开`clashy`代理

## 用REDSOCKS作透明代理重定向

- 安装`redsocks` （在[GitHub](https://github.com/darkk/redsocks)上）
- 备份并编辑`/etc/redsocks.conf`，把`redsocks`连接到`clashy`的代理IP和端口上：
  - 在`redsocks`和`redudp`两节，分别设置数据进出的`local_port`端口。
  - 把这两节中的`ip`和`port`改为系统代理设置中的值。

```json
base {
    log_debug = off;
    log_info = off;
    log = "syslog:daemon";
    daemon = on;
    redirector = iptables;
}


redsocks {
    local_ip = 0.0.0.0;
    local_port = 12345;

    ip = 127.0.0.1;
    port = 1080;

    type = socks5;
}


redudp {
    local_ip = 127.0.0.1;
    local_port = 54321;

    ip = 127.0.0.1;
    port = 1080;

	dest_ip = 8.8.8.8;
	dest_port = 53;

	udp_timeout = 30;
	udp_timeout_stream = 180;
}


dnstc {
	local_ip = 127.0.0.1;
	local_port = 5300;
}

```

## IPTABLES配置

- 清理IPTABLES

```
sudo iptables -F
```

- 开启`nat`IP掩蔽，以及Wifi网络`wlp2s0`和热点网络`ap0`之间的互通

```bash
sudo iptables -t nat -A POSTROUTING -o wlp2s0 -j MASQUERADE
sudo iptables -A FORWARD -i wlp2s0 -o ap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ap0 -o wlp2s0 -j ACCEPT
```

- 把（除了内网以外的）http/https访问的流量重定向到REDSOCKS的端口。

```bash
iptables -t nat -N REDSOCKS
iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN

iptables -t nat -A REDSOCKS -p tcp --dport 80 -j REDIRECT --to-ports 12346
iptables -t nat -A REDSOCKS -p tcp --dport 443 -j REDIRECT --to-ports 12346
iptables -t nat -A REDSOCKS -p tcp --dport 11371 -j REDIRECT --to-ports 12345
```

- 在手机上测试代理的连接。
- 把配置保存到文件

```bash
iptables-save > ~/backup/iptables
ip6tables-save > ~/backup/ip6tables
```

- 需要时重新加载

```bash
iptables-restore < ~/backup/iptables
ip6tables-restore < ~/backup/ip6tables
```

## 参见
- [jmkhael.io](https://jmkhael.io/escape-proxy-hell-with-redsocks/)
- [camelcc.com](https://www.camelcc.com/posts/rpi-hotspot-sock-proxy/)
