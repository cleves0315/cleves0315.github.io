---
title: 网址为 https://github.com/ 的网页可能暂时无法连接，或者它已永久性地移动到了新网址
tags: []
id: '22'
categories:
  - - 创作
date: 2021-10-08 20:23:00
permalink: /archives/22/
---

以管理员身份打开CMD，执行以下命令，重启生效。<!--more-->
> ipconfig /flushdns
>
> nbtstat –r
> 
> netsh int ip reset
> 
> netsh winsock reset