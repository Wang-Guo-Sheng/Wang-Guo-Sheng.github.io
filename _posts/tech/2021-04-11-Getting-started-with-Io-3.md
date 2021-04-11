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

# 领域特定语言

`Object`原型包含了处理消息传递的一切行为。当你把消息发送给对象的时候，对象将完成下列事情： 
(1) 计算所有参数，这些参数其实就是消息； 
(2) 获取消息的名称、目标和发送者； 
(3) 尝试用目标上的消息名称读取槽； 
(4) 如果槽存在，返回其数据或触发其包含的方法； 
(5) 如果槽不存在，则把消息转发给它的原型。 
这些是Io的基本继承机制。

- 处理领域特定语言JSON和XML等

## 自定义运算符读取DSL

`phonenumber.io`

## 改写`forward`写入DSL

`forward`相当于`method_missing`。下例定义了LispML的语法，从而写入XML。

`builer.io`

# 并发

## 协程

## actor

## future
