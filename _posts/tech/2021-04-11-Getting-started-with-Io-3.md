---
layout: blog
istop: false
tech: true
title: "Getting started with Io-3"
background-image: https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Io-logo.svg/200px-Io-logo.svg.png
date: 2021-04-11 10:55
category: 技术
tags:
- Io
---

`Object`原型包含了处理消息传递的一切行为。当你把消息发送给对象的时候，对象将完成下列事情： 
(1) 计算所有参数，这些参数其实就是消息； 
(2) 获取消息的名称、目标和发送者； 
(3) 尝试用目标上的消息名称读取槽； 
(4) 如果槽存在，返回其数据或触发其包含的方法； 
(5) 如果槽不存在，则把消息转发给它的原型。 
这些是Io的基本继承机制。

# 领域特定语言

- 处理领域特定语言JSON和XML等

## 自定义运算符读取DSL

`phonenumber.io`

<div id = "includedContent_io_crash_week_day3_phonebook_io"></div>

## 改写`forward`写入DSL

`forward`相当于`method_missing`。下例定义了LispML的语法，从而写入XML。

`builder.io`

<div id = "includedContent_io_crash_week_day3_builder_io"></div>

```XML
% io builder.io
ul(li("Io", p("duck")), li("Lua"), li("JaveScript"))
<ul>
    <li>
        Io
        <p>
            duck
        </p>
    </li>
    <li>
        Lua
    </li>
    <li>
        JaveScript
    </li>
</ul>


book({"author": "Tate"}, p("Content1"), p("Content2"))
<book author="Tate">
    <p>
        Content1
    </p>
    <p>
        Content2
    </p>
</book>
```

# 并发

## 协程

### 协程 vs 抢占式多任务

与**协程**（协作式多任务处理）相对的是**抢占式多任务**：coroutine/preemptive multitasking。后者在Java和基于C的语言中使用。

> 协作式环境下，下一个进程被调度的前提是当前进程主动放弃时间片；抢占式环境下，操作系统完全决定进程调度方案，操作系统可以剥夺耗时长的进程的时间片，提供给其它进程。
> 抢占式多任务：
> 1. 每个任务赋予唯一的一个优先级（有些操作系统可以动态地改变任务的优先级）；
> 2. 假如有几个任务同时处于就绪状态，优先级最高的那个将被运行；
> 3. 只要有一个优先级更高的任务就绪，它就可以中断当前优先级较低的任务的执行；

## 演员模型

在Io中，发送异步消息给任意对象，该对象就成为一个actor。

> 演员模型中，actor是并发运算的基本单元：当一个演员接收到一则消息，它可以做出一些决策、创建更多的演员、发送更多的消息、决定要如何回答接下来的消息。演员可以修改它们自己的私有状态，但是只能通过消息间接的相互影响（避免了基于锁的同步）。

actor接收到的消息是并发的，actor把新到达的消息放到队列上，并用协程处理队列中的各个消息。

### 并发问题的两种处理模型：Actors vs Threads

- 每个actor只能改变自身的状态。演员模型使用一个严格控制的队列，保证每个actor只能通过该队列接触其他actor。
- 多个线程可以不受限制地改变彼此的状态。所以线程模型面临*竞争条件*问题：如果两个线程同时存取同一个资源，就可能导致不可预测的后果。

发送了异步消息给两个对象，它们就全都变成了actor，它们将同时被执行。整个并行的过程最后返回一个`nil`。

```io
Io> slower := Object clone
==>  Object_0x5589624aab00:

Io> faster := Object clone
==>  Object_0x5589624a12a0:

Io> slower start := method(wait(2); writeln("slowly"))
==> method(
    wait(2); writeln("slowly")
)
Io> faster start := method(wait(1); writeln("quickly"))
==> method(
    wait(2); writeln("quickly")
)
Io> slower start; faster start
slowly
quickly
==> nil
Io> slower @@start; faster @@start; wait(3) # wait for both processes to finish.
quickly
slowly
==> nil
```

### `yield`

两个进程被异步触发后同时在运行，用`yield`挂起其中一个进程，可以让这个进程暂停，先执行另一个进程，另一个进程通过`yield`挂起时，再回来继续执行原来的进程。

`coroutine.io`

<div id = "includedContent_io_crash_week_day3_coroutine_io"></div>

```bash
% io coroutine.io 
Fezzik, are there rocks ahead?
If there are, we'll all be dead.
No more rhymes now, I mean it.
Anybody want a peanut?
Scheduler: nothing left to resume so we are exiting
```

通过`@@`前缀，把调用`talk`和`rhyme`两个方法的两条消息*异步*触发，它们*并发*执行，用`yield`消息在指定时间段自动把控制权交给另一方法。用`pause`等待所有异步消息执行完毕，然后退出程序。

## future

`future.io`

<div id = "includedContent_io_crash_week_day3_future_io"></div>

```bash
% io future.io   
FutureProxy
Do something immediately while fetch goes on in background
This will block until the result is available
fetched1256 bytes
Sequence
```

用单个`@`前缀的方法，会暂时返回一个future对象（`FutureProxy`），直到求值完成再替换成最终结果。

Io中的future可以自动检测deadlock，即若干进程都在等待前一个进程退出而形成循环依赖的情况。

# Extra

`brackets_list.io`

<div id = "includedContent_io_crash_week_day3_brackets_list_io"></div>
