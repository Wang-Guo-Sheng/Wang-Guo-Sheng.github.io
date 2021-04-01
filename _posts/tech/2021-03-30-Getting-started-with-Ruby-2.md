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
>> [1].class
=> Array
>> [1].methods.include?(:[])
=> true
>> Array.[](1)
=> [1]
>> a = [1, [2, 3]]
=> [1, [2, 3]]
>> a[1][1]
=> 3
>> a.push(4)
=> [1, [2, 3], 4]
>> a.pop
=> 4
>> a.pop
=> [2, 3]
>> a.pop
=> 1
```

数组拥有极其丰富的API，可将其用作队列、链表、栈、集合，等等。

### 散列表

散列表就是一串这样的键－值对：

```ruby
>> 'Hello'}
=> {1=>"one", 2=>"two", :string=>"Hello"}
>> n[1]
=> "one"
>> n[:string]
=> "Hello"
```

**符号** 是冒号开头的标识符。与字符串不同的是，写法相同的标识符始终是同一个对象：

```ruby
>> 'string'.object_id
=> 70368337399960
>> 'string'.object_id
=> 70368337213480
>> :string.object_id
=> 287068
>> :string.object_id
=> 287068
```

Ruby虽然不支持 kwargs ，但可以用散列表来模拟它，即在函数中加一个参数 `options={}` 。

将散列表用作函数的最后一个参数时，大括号可有可无。

### 代码块和 `yield`

代码块：匿名函数。可以采用 `{/}` 或 `do/end` 两种界定代码块的形式，Ruby的一般惯例是：代码块只占一行时用大括号，代码块占多行时用 `do/end` 。

如

```ruby
>> 3.times {puts 'hiya'}
hiya
hiya
hiya
=> 3
```

中， `{puts 'hiya'}` 作为参数传递给前面的函数。`{puts 'hiya'}` 是一个无参代码块。

用在代码块中 `||` 包含参数：

```ruby
>> arr = ['a', 'b', 'c']
=> ["a", "b", "c"]
>> arr.each {|ele| puts ele}
a
b
c
=> ["a", "b", "c"]
```

#### 在定义方法时调用 `yield` 输入的调用代码块：

```ruby
>> class Integer
>>     def my_times
>>         i = self
>> 0
>>             i = i - 1
>>             yield
>>         end
>>     end
>> end
=> :my_times
>> 3.my_times {puts 'mangy moose'}
mangy moose
mangy moose
mangy moose
=> nil
```

#### 代码块作为一等参数

参数名之前加 `&`  将代码块作为闭包传递给函数：

```ruby
>> def call_block(&block)
>>     block.call
>> end
=> :call_block
>> call_block {puts 'Hello'}
Hello
=> nil
>> def pass_block(&block)
>>     call_block(&block)
>> end
=> :pass_block
>> pass_block {puts 'Hello'}
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
>> 4.class
=> Integer
>> 4.class.superclass
=> Numeric
>> 4.class.superclass.superclass
=> Object
>> 4.class.superclass.superclass.superclass
=> BasicObject
>> 4.class.superclass.superclass.superclass.superclass
=> nil
```

**例** `tree.rb`

<div id = "includedContent_2021_04_02_01_01_26cf22f7"></div>

```bash
 % ruby tree.rb
Visiting a node
Ruby

visiting entire tree
Ruby
Reia
MacRuby
```

- 实例变量：对象的值
- 类变量：类的值

命名习惯：
- 类名：大写驼峰 `CamelCase`
- 实例变量： `@` 开头，小写下划线 `underscore_style`
- 类变量：  `@@`  开头，小写下划线 `underscore_style`
- 常量：全大写 `ALL_CAPS` 。
- 方法：小写下划线 `underscore_style`
- 用于逻辑测试的方法、函数加上问号 `test?`

- 初始化： `initialize` 方法
- 用 `attr` 和 `attr_accessor` 关键字定义实例变量。attr 定义实例变量和访问变量的同名方法，而 attr_accessor 定义实例变量、访问方法和设置方法。

