---
layout: blog
istop: false
tech: true
title: "Getting started with Ruby-3"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1200px-Ruby_logo.svg.png
date: 2021-04-03 20:26
category: 技术
tags:
- ruby
---

# 元编程

- 用Ruby自定义语法
- 动态地改变类

- 既便于解释器，又便于人类阅读理解。

[Builder](https://github.com/jimweirich/builder)

[ActiveRecord](https://github.com/rails/rails/tree/main/activerecord)

## 开放类

在某个类名上首次调用`class`会定义一个类；但如果该类已经定义过，再调用`class`会修改先前的类的定义，比如添加方法。因为有随时重定义任何类或对象的自由，所以称为开放类。这种写法让代码实现简单易懂。

`blank.rb`

<div id = "includedContent_2021_04_04_20_09_6905d014"></div>

```bash
% ruby blank.rb
person
```

这样，不论是`nil`还是`""`，因为两个类都具有`blank?`方法，就可以用相同的方式判断是否空字符串（鸭子类型）。

`units.rb`把各种单位转成英寸：

<div id = "includedContent_2021_04_04_20_09_82d765c3"></div>

```bash
% ruby units.rb
24
24
24
-633600
```

## 使用`method_missing`

调用的方法找不到时，Ruby会调用`method_missing`方法。通过覆盖这个方法，可以把输入的方法名称作为参数，实现特殊的功能。但这时需要另外处理未知的方法名称，保证严格的错误检查。

`roman.rb`

<div id = "includedContent_2021_04_04_20_09_95fee552"></div>

```bash
10
90
12
NoMethodError
```

## 模块

比如要读取一个 `csv` 表格：

### 直接用类实现

`acts_as_csv_class.rb`

<div id = "includedContent_2021_04_04_20_09_9257f3bf"></div>

### 用**宏**实现

通过宏中的方法调用`define_method`添加这组方法：

`acts_as_csv.rb`

<div id = "includedContent_2021_04_04_20_09_819babba"></div>

### 用模块实现：

`acts_as_csv_module.rb`

<div id = "includedContent_2021_04_04_20_09_98f422ce"></div>

- 只要某个模块被另一模块包含，Ruby就会调用该模块的`included`方法。

> 类是可以被实例化的模块。

- 调用该模块的类，在模块中记为`base`。

- 通过`extend`添加**类方法**
- 通过`include`添加**实例方法**

## 第三天自习

`acts_as_csv_module_csvrow.rb`

<div id = "includedContent_2021_04_04_20_59_4e666415"></div>

打印指定元素。
