---
layout: blog
istop: false
tech: true
title: "Getting started with Io-2"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Io-logo.svg/200px-Io-logo.svg.png
date: 2021-04-09 14:34
category: 技术
tags:
- Io
---

如何用Io的槽和消息构造核心行为。 

## 控制流

### 循环

- `loop(<...>)`
- `while(i <= stop, <...>, i += step)`
- `for(i, start, stop[, step], <...>)`

### 多余参数问题

可以自由输入无用的多余参数：如果输入参数超过最多需要的参数，多余的参数只会被忽略；但如果前面有可选参数（比如`for`中的步长）没有输入，就会使语句脱离本意，而Io编译器不会检查出这种错误。

### 条件控制

- `if(condition, true code, false code)`会返回条件执行语句的返回结果。
- `if(condition) then(true code) else(false code)`只执行，不返回。

## 运算符

```Io
Io> OperatorTable
==> OperatorTable_0x562d908bef60:
Operators
  0   ? @ @@
  1   **
  2   % * /
  3   + -
  4   << >>
  5   < <= > >=
  6   != ==
  7   &
  8   ^
  9   |
  10  && and
  11  or ||
  12  ..
  13  %= &= *= += -= /= <<= >>= ^= |=
  14  return

Assign Operators
  ::= newSlot
  :=  setSlot
  =   updateSlot

To add a new operator: OperatorTable addOperator("+", 4) and implement the + message.
To add a new assign operator: OperatorTable addAssignOperator("=", "updateSlot") and implement the updateSlot message.
```

### 添加自定义运算符

通过`addOperator`可以往指定优先级添加自定义的运算符，然后要对二元运算符左侧的可能出现的各个对象类型分别定义以该运算符为名的方法。优先级在省略括号时起作用。

赋值运算符自成一表。它们会像消息那样运行。

## 消息

通过消息，可以实现自己的控制结构。

除了注释符和参数之间的逗号外的一切都是消息。

### 发送者，目标，参数

消息由发送者发送至目标，然后由目标执行该消息。 

用`call`方法访问*元信息*，例如：

```Io
postOffice = Object clone
postOffice packageSender := method(call sender)
postOffice messageTarget := method(call target)
postOffice getMessage := method(call message)
postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)
```

直接调用`postOffice packageSender`，返回`postOffice`对象本身。

在其它对象中调用`postOffice packageSender`，返回直接在其方法中包含这条调用语句的对象。

调用`postOffice messageTarget`，总是返回`postOffice`对象本身。

*参数*：在消息中用括号包含参数列表，`call message arguments`返回一个包含参数列表的`List`对象。

#### 定义控制结构

Io的对象不会先把收到消息中的参数求值后再放到栈上，而是直接把收到的整句消息发送给它的方法中调用的那个最终接受消息的对象，在后者的内部的语境中求值。

利用这种特性可以定义控制语句

`unless.io`

<div id = "includedContent_io_crash_week_day2_unless_io"></div>

## 对象反射（Object reflection）

`animals.io`

<div id = "includedContent_io_crash_week_day2_animals_io"></div>

- Io的消息反射：获取消息的名称、发送者、目标、参数
- Io的对象反射：获取对象的名称、原型、槽

> **Reflection** is the ability of a program to manipulate variables, properties, and methods of objects at runtime. Reflection refers to the ability for code to examine attributes about objects that might be passed as parameters to a function.

## Extra

`fib.io`

<div id = "includedContent_io_crash_week_day2_fib_io"></div>

`fake_div.io`

<div id = "includedContent_io_crash_week_day2_fake_div_io"></div>

`sum2d.io`

<div id = "includedContent_io_crash_week_day2_sum2d_io"></div>

`my_average.io`

<div id = "includedContent_io_crash_week_day2_my_average_io"></div>

`matrix.io`

<div id = "includedContent_io_crash_week_day2_matrix_io"></div>

`rand_guess.io`

<div id = "includedContent_io_crash_week_day2_rand_guess_io"></div>
