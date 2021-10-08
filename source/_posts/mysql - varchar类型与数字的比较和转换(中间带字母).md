---
title: mysql - varchar类型与数字的比较和转换(中间带字母)
tags: []
id: '20'
categories:
  - - 创作
date: 2021-10-07 13:45:00
permalink: /archives/20/
---

## 前言：

> 在这次项目中遇到条件范围筛选。
>
> 对某个字段做范围查询。
> 
>* 筛选的值数据库存储类型为varchar  
>* 是有规律的字母掺加时间数字加顺序递增的数字序号
<!--more-->

## 思路 

首先这个值的筛查条件以日期做选择范围，Mysql语法做范围查询我优先选择比较运算符。

然后就是了解Mysql字符串类型转换。

查阅了文档了解到，在mysql里转化语法主要为两个 **cast** 和 **convert**

```sql
CAST(value as type);
CONVERT(value, type);
```
当 '123aaa' -> ‘123’； ‘abc’ -> 0    ‘abc123’  ->  '0'   // 遇到字母就不转化

**这时候字符串与数字比较问题已经解决了，**下个问题就是对字符串进行裁剪

看了mysql的函数文档
> substring(str, star, len);  // 对字符串做裁剪


## 实例：

最终我们的问题解决函数就出来了:

如如下一张表:
employee_list



|  id   | name  |
|  ----  | ----  |
| AAAA20201206-00001  | xiaohong |
| AAAA20201207-00001  | xiaoming |
| AAAA20201207-00001  | xiaoming |
| AAAA20201209-00001  | xiaohuang |

查询20201206 到 20201209 区间的数据，不包括(20201206 和 20201209)

mysql语法：

> SELECT * FROM employee_list where cast(substring(id, 5, 8) as SIGNED) > 20201206 AND cast(substring(id, 5, 8) as SIGNED) < 20201209;

其中：核心方法**substring()方法**

第一个参数接收**字段名**

第二个参数是要提取的**索引位（从1开始）**

第三个参数表示**从索引位开始要再提取几位字符**

**所以： substring(id, 5, 8)  -> 20201206**

 

## 核心方法cast()方法：

**把上面提取好的字符串转数字： cast('20201206' as SIGNED);   // (数值类型)**


