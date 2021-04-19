---
layout: blog
istop: false
tech: true
title: "Getting started with Haskell-1"
background-image: https://wiki.haskell.org/wikiupload/4/4a/HaskellLogoStyPreview-1.png
date: 2021-04-14 20:42
category: 技术
tags:
- haskell
---

*函数式*

- 只有函数没有对象； 
- 通常来说，给定相同输入，这些函数将返回相同的值； 
- 这些函数通常没有副作用，也就是说，它们不改变程序的状态； 
- 任何变量都只能赋值一次。 

*Haskell*

- 上句结果：`it`
- 帮助：`:?`，设置：`:set`/`:unset`
- 直接运行模块：`runghc <name>.hs`
- 终端：`ghci`
- 在ghci中运行模块：`:load <name>.hs`，`:l <name>.hs`；再用`:m`退出
- 退出ghci：`:quit`
- 注释单行`--<comments>`，多行`{-comments-}`
- 变量名必须小写开头

### 字符串

- 用`++`连接字符串。
- 字符串只是字符列表，空字符串等于空列表。

```Haskell
Prelude> ['a', 'b'] == "ab"
True
```

- 可以用不带空格的冒号把单个字符连接在字符串开头。

### Booleans and others

- 不等于`/=`，逻辑非`not`
- 必须正确缩进
- `if`-`then`-`else`是函数而非控制结构
- 强类型，`if`只严格地接受布尔类型参数
- 查看类型： `:t`，`:type`，它们只显示类型而不求值
- 返回结果时显示类型：`:set +t`，`:unset + t`

## 函数

由于Haskell既是强类型语言，又是静态语言，因此每个函数的定义都包含两个部分：

- 类型声明：规格说明（可选）
- 函数声明：具体实现

`double.hs`

### 递归，模式匹配，哨兵表达式

Haskell依靠尾递归优化高效地处理递归。

`factorial.hs`

哨兵表达式是约束参数值的条件

`fact_with_guard.hs`

- 用点号复合两个函数。
- 三元表达式是`if`，`then`，`else`

## 元组和列表

- 列表是同质的，元素类型必须相同。
- 元组可以包含不同类型。
- 通过冒号把元素添加到列表首位。
- 通过冒号匹配Head/Tail

```haskell
Prelude> let h:t = [1,2,3]
Prelude> h
1
Prelude> t
[2,3]
```
- 遍历：用Head/Tail匹配递归

`lists.hs`

- `zip`两个列表得到二元组的列表，长度是较短列表的长度。
- 两点表示范围（如`[1..10]`，`[1,3..9]`）。

- 列表生成式：如`[ (a, b) | a <- crew, b<- crew, a < b]`。

## Extra

`my_reverse.hs`

`combination.hs`

`multiplication_table.hs`

 `map.hs`
 