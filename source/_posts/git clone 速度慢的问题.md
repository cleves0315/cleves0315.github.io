---
title: git clone 速度慢的问题
tags: []
id: '17'
categories:
  - - 创作
date: 2021-10-04 11:11:00
permalink: /archives/17/
---

## 办法
使用国内镜像，目前已知Github国内镜像网站有github.com.cnpmjs.org和git.sdut.me。<!--more-->

速度根据各地情况而定，在clone某个项目的时候将github.com替换为github.com.cnpmjs.org即可。

> //这是我们要clone的
> git clone https://github.com/Hackergeek/architecture-samples
>  
> //使用镜像
> git clone https://github.com.cnpmjs.org/Hackergeek/architecture-samples
>  
> //或者
>  
> //使用镜像
> git clone https://git.sdut.me/Hackergeek/architecture-samples
