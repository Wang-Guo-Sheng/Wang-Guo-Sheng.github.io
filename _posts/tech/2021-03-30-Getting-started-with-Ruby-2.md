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

代码块：匿名函数。可以采用 `{/}` 或 `do/end` 两种界定代码块的形式，Ruby的一般惯例是：代码块只占一行时用大括号，代码块占多行时用 `do/end` 。

如

```ruby
irb(main):029:0> 3.times {puts 'hiya'}
hiya
hiya
hiya
=> 3
```

中， `{puts 'hiya'}` 作为参数传递给前面的函数。`{puts 'hiya'}` 是一个无参代码块。

用在代码块中 `||` 包含参数：

```ruby
irb(main):030:0> arr = ['a', 'b', 'c']
=> ["a", "b", "c"]
irb(main):031:0> arr.each {|ele| puts ele}
a
b
c
=> ["a", "b", "c"]
```

#### 在定义方法时调用 `yield` 输入的调用代码块：

```ruby
irb(main):032:0> class Integer
irb(main):033:1>     def my_times
irb(main):034:2>         i = self
irb(main):035:2>         while i > 0
irb(main):036:3>             i = i - 1
irb(main):037:3>             yield
irb(main):038:3>         end
irb(main):039:2>     end
irb(main):040:1> end
=> :my_times
irb(main):041:0> 3.my_times {puts 'mangy moose'}
mangy moose
mangy moose
mangy moose
=> nil
```

#### 代码块作为一等参数

参数名之前加 `&`  将代码块作为闭包传递给函数：

```ruby
irb(main):049:0> def call_block(&block)
irb(main):050:1>     block.call
irb(main):051:1> end
=> :call_block
irb(main):052:0> call_block {puts 'Hello'}
Hello
=> nil
irb(main):053:0> def pass_block(&block)
irb(main):054:1>     call_block(&block)
irb(main):055:1> end
=> :pass_block
irb(main):056:0> pass_block {puts 'Hello'}
Hello
=> nil
```

#### 代码块用于执行控制：延迟执行、条件执行、成块执行

把需要延迟的代码打包在代码块中，直到特定时间、特定条件才通过 `yield` 执行。

把一部分连续的代码提出成代码块，在原来的位置用 `yield` 代替。

以下是可复用组件。

### 类

Ruby的类必须继承自超类。

```ruby
irb(main):062:0> 4.class
=> Integer
irb(main):063:0> 4.class.superclass
=> Numeric
irb(main):064:0> 4.class.superclass.superclass
=> Object
irb(main):065:0> 4.class.superclass.superclass.superclass
=> BasicObject
irb(main):066:0> 4.class.superclass.superclass.superclass.superclass
=> nil
```

<div id="includedContent_2021_03_31_22_19"></div>

