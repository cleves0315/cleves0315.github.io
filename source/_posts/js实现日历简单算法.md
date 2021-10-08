---
title: js实现日历简单算法
tags: []
id: '18'
categories:
  - - 创作
date: 2021-10-04 13:01:00
permalink: /archives/18/
---

**前言：在之前的项目中自己封装了一个简单的日历格式数据。**<!--more-->

```javascript
/**
 * 初始化当天的日历数据 (没有参数默认当天)
 * @method
 * @param {Date} date
 * @param {Number} line 日历中显示几行
 * @returns [[],[]]
 */
function initMonthCalendar(dates, line = 6) {
  var date = new Date(dates);                          // 初始时间格式
  var y = date.getFullYear();
  var m = date.getMonth();
  var days = new Date(y, m + 1, 0).getDate();          // 获取这个月共有多少天
  var firstDayWeek = new Date(y, m, 1).getDay();       // 月份第一天星期几

  var arr = [];     // 存储日历格式的数组
  var n = [];       // 日历格式中的一行
  var d = 1;        // 日历格式中的天数

  // 先根据这个月第一天排星期几
  // 把上个月剩下几天留在这个月的'奸细'放在最前头
  for(let i = 0; i < firstDayWeek; i++) {
    // new Date(2020, 8, 0)   --> 9月没有0号 === 8月3127     n.unshift(getDate(y, m, 0 - i).getDate());
  }

  // 开启循环
  // 一星期占一行，一行一个外循环
  // 这里我默认想要6行
  for (let j = 0; j < line; j++) {
    // 一天占一个格子，最多一星期7个格子
    // 这里我想要7个格子
    for (let i = 0; i < 7; i++) {
      if(d > days) {
        // 这个月都放完了，该放什么？
        // new Date(2020, 8, 31)  --> 9月没有31 === 10月　　　　　 n.push(new Date(y, m, d++).getDate());
      } else {
        // 放置这个月的天　　　　　 n.push(d++);
      }51 
      if (n.length == 7) break;    // 放了7个格子该结束了
    }

    arr.push(n);
    n = [];           // 这一行放完了，清空ba
  }

  return arr;
}
```

**使用**：

```javascript
var calendar= initMonthCalendar('2020-09-19');

console.log(calendar);

// [
//     [30, 31, 1, 2, 3, 4, 5]
//     [6, 7, 8, 9, 10, 11, 12]
//     [13, 14, 15, 16, 17, 18, 19]
//     [20, 21, 22, 23, 24, 25, 26]
//     [27, 28, 29, 30, 1, 2, 3]
//     [4, 5, 6, 7, 8, 9, 10]
// ]
```

**获取这一年的日历：**

```javascript
var arr = [];
var y = new Date().getFullYear();

for (let i = 0; i < 12; i++) {
  const d = '' + y + '-0' + (i + 1) + '-01';

  arr.push(initMonthCalendar(d))
}   

console.log(arr)
```
