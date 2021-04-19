---
layout: blog
istop: false
tech: true
title: "Getting started with Haskell-2"
background-image: https://wiki.haskell.org/wikiupload/4/4a/HaskellLogoStyPreview-1.png
date: 2021-04-19 18:36
category: 技术
tags:
- haskell
---

## 高阶函数

- 匿名函数：`(\param1[.. paramn] -> <function_body>)`
- 映射：`map (\param1[.. paramn] -> <function_body>)`

这两者可以接参数，也可以作为函数定义。

- 可用缩进的`where`声明局部函数`function_body`


- 筛选：`filter function_body list`
- 累积：`foldl/foldr <binary_function/operator> <initial_value> <list>`，或者`foldl1/foldr1 <binary_function/operator> <list>`


- 偏应用函数：只输入部分参数，返回可输入剩余参数的函数。
- 部分使用（*section*），如`map (+ 1) [1, 2, 3]`
- 柯里化：当Haskell计算`prod 2 3`时，它实际上计算`(prod 2) 3`。几乎每个Haskell中的多参数函数都是柯里化的。

```haskell
Prelude> prod = (\x y -> x*y)
Prelude> :t prod
prod :: Num a => a -> a -> a
```

### 惰性求值（迭代器）

- `zipWith`用二元函数作用于两个列表/无穷列表。
- `take`获取列表的前若干位。
- 用递归或者不带终止值的列表实现无穷列表。

`my_range.hs`

```haskell
*Main> take 10 (myRange 1 2)
[1,3,5,7,9,11,13,15,17,19]
```

`lazy_fib.hs`

