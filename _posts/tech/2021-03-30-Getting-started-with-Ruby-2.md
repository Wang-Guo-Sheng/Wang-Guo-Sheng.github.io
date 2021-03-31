---
layout: blog
istop: false
tech: true
title: "Getting started with Ruby-2"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1200px-Ruby_logo.svg.png
date: 2021-03-31 17:34
category: 技术
tags:
- ruby
---

### 函数

如果你没有显式指定某个返回值，函数就将返回退出函数前最后处理的表达式的值。

### 数组

`[]` 是 Array 类的方法，`[]` 和 `[]=` 不过是访问数组的语法糖而已。

```ruby
 % irb
irb(main):001:0> [1].class
=> Array
irb(main):002:0> [1].methods.include?(:[])
=> true
irb(main):005:0> Array.[](1)
=> [1]
irb(main):010:0> a = [1, [2, 3]]
=> [1, [2, 3]]
irb(main):016:0> a[1][1]
=> 3
irb(main):011:0> a.push(4)
=> [1, [2, 3], 4]
irb(main):012:0> a.pop
=> 4
irb(main):013:0> a.pop
=> [2, 3]
irb(main):014:0> a.pop
=> 1
```

数组拥有极其丰富的API，可将其用作队列、链表、栈、集合，等等。

### 散列表

散列表就是一串这样的键－值对：

```ruby
irb(main):021:0> n = {1 => 'one', 2 => 'two', :string => 'Hello'}
=> {1=>"one", 2=>"two", :string=>"Hello"}
irb(main):022:0> n[1]
=> "one"
irb(main):023:0> n[:string]
=> "Hello"
```

**符号** 是冒号开头的标识符。与字符串不同的是，写法相同的标识符始终是同一个对象：

```ruby
irb(main):024:0> 'string'.object_id
=> 70368337399960
irb(main):025:0> 'string'.object_id
=> 70368337213480
irb(main):026:0> :string.object_id
=> 287068
irb(main):027:0> :string.object_id
=> 287068
```

Ruby虽然不支持 kwargs ，但可以用散列表来模拟它，即在函数中加一个参数 `options={}` 。

将散列表用作函数的最后一个参数时，大括号可有可无。

### 代码块和 `yield`

