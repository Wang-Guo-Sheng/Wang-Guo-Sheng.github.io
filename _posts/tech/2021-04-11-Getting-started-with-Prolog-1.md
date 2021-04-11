---
layout: blog
istop: false
tech: true
title: "Getting started with Prolog-1"
background-image: http://www.gprolog.org/gprolog.png
date: 2021-04-11 18:51
category: 技术
tags:
- Prolog
---

# 概况

## 语法结构

- 句末加点

```prolog
| ?- write('Hello,'), nl, write('world').
Hello,
world

yes
| ?- halt.
```

4 种元素（*term*）：

- atom
- number
- variable
- complex term

其中

- 常量（*atom*）以小写字母开头
- 变量以大写字母或下划线开头
- 匿名变量：`_`

三种基本结构：

- 数据库(knowledge base/database)
    - 事实(facts)
    - 规则(rules)
- 查询(queries)

在程序中定义一组事实和规则，然后执行查询。

多个子目标用逗号隔开组合成复合的查询，逗号相当于逻辑且。

`\+`：逻辑非。

## 编译查询

`friends.pl`

### 编译方法

#### 在终端`gprolog`中编译：

```prolog
| ?- ['friends.pl'].
compiling /home/stormy/文档/GitHub/7_langs_7_weeks/prolog_crash_week/day1/friends.pl for byte code...
/home/stormy/文档/GitHub/7_langs_7_weeks/prolog_crash_week/day1/friends.pl compiled, 5 lines read - 1051 bytes written, 5 ms

(1 ms) yes
```

编译成功返回`yes`（true）。

#### 编译输出可执行文件

```bash
gplc friends.pl
```

输出`./friends`，执行后又进入终端。


### 在终端中执行查询

```prolog
| ?- friend(grommit, wallace). 

yes
```

查询结果返回是或否。
- 如果有报错信息，会把函数缩写为`函数名/参数数目`。
- 查询可以用逗号结合起来。
- `listing(rule)`函数可以列出所有符合规则`rule`的变量组合。
- 用新的任意变量名占位，可以列出所有符合条件的变量，或者查询是否存在变量符合条件。

```prolog
| ?- likes(grommit, What).

What = cheese ? ;

What = cake

yes
```

