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
    - 事实(facts)，谓词（predicate）
    - 规则(rules)
- 查询(queries)

在程序中定义一组事实和规则，然后执行查询。

多个子目标用逗号隔开组合成复合的查询，逗号相当于逻辑且。

`\+`：逻辑非。

## 编译查询

`friends.pro`

<div id = "includedContent_prolog_crash_week_day1_friends_pro"></div>

### 编译方法

#### 在终端`gprolog`中编译：

方括号、单引号。

```prolog
| ?- ['friends.pro'].
compiling /home/.../prolog_crash_week/day1/friends.pro for byte code...
/home/.../prolog_crash_week/day1/friends.pro compiled, 5 lines read - 1051 bytes written, 5 ms

(1 ms) yes
```

编译成功返回`yes`（true）。

#### 编译输出可执行文件

```bash
gplc friends.pro
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

#### 连续查询多个结果项

```prolog
| ?- likes(grommit, What).

What = cheese ? ;

What = cake

yes
```

在查询中用新的任意变量名占位，可以列出所有符合条件的变量，或者查询是否存在变量符合条件。终端返回一项符合条件的结果后手动输入分号查询下一个，输入回车可以提前终止查询并返回`yes`；若连续输入分号直到输出了所有符合条件的项，则会在在输出最后一项后立即返回`yes`；若连续输入分号之后返回了`no`，说明存在不能由简单的*事实*直接确定的项，需要进一步计算。输入`a`可以输出所有剩余的结果。

`food.pro`

<div id = "includedContent_prolog_crash_week_day1_food_pro"></div>

```prolog
| ?- food_flavor(What, savory).

What = velveeta ? ;

What = spam ? ;

What = sausage ? ;

(1 ms) no
```

#### 地图填色问题

`map.pro`

<div id = "includedContent_prolog_crash_week_day1_map_pro"></div>

> Prolog 不需要人在程序中输入算法，而是由计算机自己尝试解决逻辑问题。
>
> *If you can describe the problem, you have solved the problem.*

```prolog
| ?- coloring(Alabama, Mississippi, Georgia, Tennesse, Florida).

Alabama = blue
Florida = green
Georgia = red
Mississippi = red
Tennesse = green ? a

Alabama = green
Florida = blue
Georgia = red
Mississippi = red
Tennesse = blue

Alabama = blue
Florida = red
Georgia = green
Mississippi = green
Tennesse = red

Alabama = red
Florida = blue
Georgia = green
Mississippi = green
Tennesse = blue

Alabama = green
Florida = red
Georgia = blue
Mississippi = blue
Tennesse = red

Alabama = red
Florida = green
Georgia = blue
Mississippi = blue
Tennesse = green

(1 ms) no

```


## 合一（Unification）

`ohmy.pro`

<div id = "includedContent_prolog_crash_week_day1_ohmy_pro"></div>

这里的等号表示unify，即“要求两侧相等”，而不是赋值，所以可以左右交换而不改变含义和结果。同时，`x = x + 1`这样的程序会返回`no`，因为Prolog的变量要么有固定的值，要么不具有特定值。

```prolog
| ?- dorothy(lion, tiger, bear). 

yes
| ?- dorothy(A, B, C).          

A = lion
B = tiger
C = bear

yes
| ?- twin_cats(A, B).

A = lion
B = lion ? a

A = lion
B = tiger

A = tiger
B = lion

A = tiger
B = tiger

yes

```

## Links

[GProlog Manual](http://www.gprolog.org/manual/gprolog.html)

[Amzi! inc. Adventure in Prolog tutorial](https://www.amzi.com/AdventureInProlog/a1start.php)[Prolog 语言入门教程 - 阮一峰的网络日志](https://www.ruanyifeng.com/blog/2019/01/prolog.html)[Solving murder with Prolog | xmonader](https://xmonader.github.io/prolog/2018/12/21/solving-murder-prolog.html)[Prolog 基础 <1> - 面向信仰编程](https://draveness.me/prolog-ji-chu-1/)|[wikibooks](https://en.wikibooks.org/wiki/Prolog)
