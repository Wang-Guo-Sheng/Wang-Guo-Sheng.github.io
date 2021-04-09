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

通过`addOperator`可以往指定优先级添加自定义的运算符。

赋值运算符自成一表。它们会像消息那样运行。

## 消息

通过消息，可以实现自己的控制结构。

除了注释符和参数之间的逗号外的一切都是消息。

### 发送者，目标，参数

消息由发送者发送至目标，然后由目标执行该消息。 

