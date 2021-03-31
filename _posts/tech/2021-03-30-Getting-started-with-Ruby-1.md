---
layout: blog
istop: false
tech: true
title: "Getting started with Ruby-1"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1200px-Ruby_logo.svg.png
date: 2021-03-30 23:23
category: 技术
tags:
- ruby
---

今天，是第一天。

> Ruby 是一种通用的、解释的编程语言。
> Ruby 是一种真正的面向对象编程语言。
> Ruby 是一种类似于 Python 和 Perl 的服务器端脚本语言。
> Ruby 可以用来编写通用网关接口（CGI）脚本。
> Ruby 可以被嵌入到超文本标记语言（HTML）。
> Ruby 语法简单，这使得新的开发人员能够快速轻松地学习 Ruby。
> Ruby 与 C++ 和 Perl 等许多编程语言有着类似的语法。
> Ruby 可扩展性强，用 Ruby 编写的大程序易于维护。
> Ruby 可用于开发的 Internet 和 Intranet 应用程序。
> Ruby 可以安装在 Windows 和 POSIX 环境中。
> Ruby 支持许多 GUI 工具，比如 Tcl/Tk、GTK 和 OpenGL。
> Ruby 可以很容易地连接到 DB2、MySQL、Oracle 和 Sybase。
> Ruby 有丰富的内置函数，可以直接在 Ruby 脚本中使用。

```bash
 % ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
```

- 交互命令行 `irb`
- 解释执行
- 双引号引发字符串替换
- 每个语句都有返回值

```ruby
% irb
>> lang = 'Ruby'
=> "Ruby"
>> puts "hello, #{lang}"
hello, Ruby
=> nil
>> puts 'hello, #{lang}'
hello, #{lang}
=> nil
```

### Ruby的编程模型：纯面向对象

```ruby
 % irb
>> 4
=> 4
>> 4.class
=> Integer
>> 4 + 4
=> 8
>> 4.methods
=> [:-@, :**, :<=>, :upto, :<<, :<=, :>=, :==, :chr, :===, :>>, :[], :%, :&, :inspect, :+, :ord, :-, :/, :*, :size, :succ, :<, :>, :to_int, :coerce, :divmod, :to_s, :to_i, :fdiv, :modulo, :remainder, :abs, :magnitude, :integer?, :numerator, :denominator, :floor, :ceil, :round, :truncate, :lcm, :to_f, :^, :gcdlcm, :odd?, :even?, :allbits?, :anybits?, :nobits?, :downto, :times, :pred, :pow, :bit_length, :digits, :rationalize, :gcd, :to_r, :next, :div, :|, :~, :+@, :eql?, :singleton_method_added, :i, :real?, :zero?, :nonzero?, :finite?, :infinite?, :step, :positive?, :negative?, :rectangular, :arg, :real, :imaginary, :imag, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :polar, :clone, :dup, :rect, :quo, :between?, :clamp, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :instance_variable_get, :instance_variables, :method, :public_method, :singleton_method, :define_singleton_method, :public_send, :extend, :to_enum, :enum_for, :pp, :=~, :!~, :respond_to?, :freeze, :object_id, :send, :display, :nil?, :hash, :class, :singleton_class, :itself, :yield_self, :taint, :tainted?, :untrust, :untaint, :trust, :untrusted?, :methods, :frozen?, :protected_methods, :singleton_methods, :public_methods, :private_methods, :!, :equal?, :instance_eval, :instance_exec, :!=, :__send__, :__id__]
```

- 单独的数字也是对象。
- `.methods`返回方法数组

### 判断：核心思想

#### `true` 和 `false`是一等对象

```ruby
>> x = 4
=> 4
>> x < 5
=> true
>> x <= 4
=> true
>> 4
=> false
>> false.class
=> FalseClass
>> true.class
=> TrueClass
```

表达式取值为 `true` 或 `false`。 `true` 和 `false`是一等对象（可以存储在数据结构中、作为参数和返回值、在运行时创建）。

#### 把简单的想法精炼到短短一行代码之中

`if` 和 `unless` 可以用单行形式：

```ruby
>> puts "Hello" unless true
=> nil
>> puts "Hello" if true
Hello
=> nil
```

而块形式需要以 `end` 结尾。`while` 和 `until` 与此类似。

取反：`not` 或 `!`。

短路与：`and` 或 `&&`。

短路或：`or` 或 `||`。

非短路与：`&`。

非短路或：`|`。

注意：

- 只有 `false` 和 `nil` 是 `false`，其它所有值都是 `true`，`0` 也是 `true` 。

```ruby
>> puts 'a' if 0
a
=> nil
```

### 鸭子类型

强类型。Ruby 多数时候是强类型语言。强类型语言会对某些操作进行类型检查，并在其造成破坏前加以阻止。

动态类型。Ruby 是在运行时而非编译时进行类型检查的，`def` 定义函数时不会执行它，执行函数时才会进行类型检查和报错。

![types_of_languages](../../../style/img/md/types_of_languages.png)

鸭子类型并不在乎其内在类型可能是什么。只要它像鸭子一样走路，像鸭子一样嘎嘎叫，那它就是只鸭子。

```ruby
>> a = [100.0, '100']
=> [100.0, "100"]
>> a[0].to_i
=> 100
>> a[1].to_i
=> 100
```

鸭子类型方便实现面向对象设计：对接口编码，不对实现编码。对象若有 `push `和 `pop `方法，它就能当作栈来用。

### 小结

> Ruby是一门解释型语言。一切皆为对象，且易于获取对象的任何信息，如对象的各方法及所属类。它是鸭子类型的，且行为通常和强类型语言毫无二致，尽管一些学者会争论其中差别。它也是崇尚自由精神的语言，允许你做几乎一切事情，包括修改 `NilClass `或 `String `这样的核心类。

### 第一天自习

[Ruby API Documentation](https://rubyapi.org/)

[Programming Ruby: The Pragmatic Programmer’s Guide](https://ruby-doc.com/docs/ProgrammingRuby/)

[Ruby tutorial](https://www.runoob.com/ruby/ruby-tutorial.html)

[String Replace](https://stackoverflow.com/questions/8381499/replace-words-in-a-string-ruby)

```ruby
>> s = 'Joe Doe is known by Joe'
=> "Joe Doe is known by Joe"
>> s.sub! 'Doe', 'Dane'
=> "Joe Dane is known by Joe"
>> s.gsub! 'Joe', 'Jane'
=> "Jane Dane is known by Jane"
```

[Ruby 正则表达式](https://www.runoob.com/ruby/ruby-regular-expressions.html)

`%r`

[Ruby 范围](https://www.runoob.com/ruby/ruby-range.html)

两点：闭合，三点：左闭右开。

```ruby
>> puts "#{(1..5).to_a}"
[1, 2, 3, 4, 5]
=> nil
>> puts "#{(1...5).to_a}"
[1, 2, 3, 4]
=> nil
>> (0..5).each do |d| puts "#{d}" end
0
1
2
3
4
5
=> 0..5
```

范围也可以用作条件表达式，也可以用在 case 语句中。

检查指定值是否在指定的范围内。需要使用 `===` 相等运算符来完成计算。

<div id = "includedContent_2021_04_01_01_21_dfd1e3b4"></div>
<div id = "includedContent_2021_04_01_01_21_77243162"></div>
<div id = "includedContent_2021_04_01_01_21_d0f46fc7"></div>
<div id = "includedContent_2021_04_01_01_21_e0579da1"></div>
