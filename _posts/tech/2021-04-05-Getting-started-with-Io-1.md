---
layout: blog
istop: false
tech: true
title: "Getting started with Io-1"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Io-logo.svg/200px-Io-logo.svg.png
date: 2021-04-05 21:05
category: 技术
tags:
- Io
---

> **基于原型**编程（prototype-based programming）或称为原型程序设计、原型编程，是面向对象编程的子系统和一种方式。行为重用（继承）是通过复制已经存在的原型对象实现的。或称**无类**的、**面向原型**、或者是**基于实例**的编程。

- Io语法把消息全部串联起来，每条消息都会返回一个对象，也都带有置于括号内的可选参数。
- 万物皆为消息，每条消息都会返回另一接收消息的对象。
- 没有关键字，只有少量在行为上接近于关键字的字符。

## 原型编程范型

-  所有事物都是`对象`； 
- 所有与对象的交互都是`消息`； 
- 你要做的不是实例化类，而是复制那些叫做`原型`的对象； 
- 对象会记住它的原型，通过`proto`方法查看；
- 对象有`槽`，通过`slotNames`方法列出； 
- 槽包含对象（包括`方法`对象`method(...)`）； 
- `消息`返回槽中的值，或调用槽中的方法； 
- 如果对象无法响应某消息，则它会把该消息发送给自己的原型，溯继承树而上直到根对象。
- 用小写字母开头命名可以`clone`出不带`type`槽的对象，类似于实例。

### 命名空间

- 根对象`Object`
- 主命名空间`Lobby`，包含了所有的已命名对象

## 列表和映射

### 列表`List`对象

复制自`List`，或者通过`Object`的方法`list`来创建。

### `Map`对象

相当于散列表。可以转换成对象（`asObject`）。

### 单例 singleton

`true`和`false`都是单例，它们的`clone`方法被重定义为返回对象本身，从而保证全局只有一个这样的对象。

`nil`和`false`为假，其它都为真，0和空字符串也是真。

### 一

`:=`赋值，`=`改写现存对象，`::=`除了赋值以外还可以在对象中添加可通过`set_()`重设的槽。

| operator | action                                                       |
| :------- | :----------------------------------------------------------- |
| ::=      | Creates slot, creates setter, assigns value                  |
| :=       | Creates slot, assigns value                                  |
| =        | Assigns value to slot if it exists, otherwise raises exception |

`hello.rb`

<div id = "includedContent_2021_04_08_10_35_43158e3"></div>

----

[Io 格式规范](https://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide)

[Io guide](https://iolanguage.org/guide/guide.html)

[Io tutorial](https://iolanguage.org/tutorial.html)

