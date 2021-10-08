---
title: 关于 Airbnb JavaScript 代码规范阅读收获（javascript代码风格、规范）
tags: []
id: '19'
categories:
  - - 创作
date: 2021-10-06 13:22:00
permalink: /archives/19/
---

## 本文只做个人阅读 Airbnb JavaScript规范 的收获。
（更多资料可以到官方查看）

[官方地址](https://airbnb.io/javascript/)

[参考中文翻译文档地址](https://www.kancloud.cn/kancloud/javascript-style-guide/43119)<!--more-->

## 3. 对象
```javascript
3.1 使用对象字面量创建对象
// bad
const item = new Object();

// good 
const item = {};


3.2 如果你的代码在浏览器环境下执行，别使用 保留字 作为键值。这样在 IE8 不会执行。但在 ES6 和服务端中使用没问题。
// bad 
const superman = {
  default: { clark: 'kent' },
  private: true
}

// good 
const superman = {
  defaults: { clark: 'kent' },
  private: true
}


3.5 使用对象方法简写。
// bad
const atom = {
  value: 1,
  addValue: function(value) {
    return atom.value + value;
  }
}

// good
const atom = {
  value: 1,
  addValue(value) {
    return atom.value + value;
  }
}


3.6 使用对象属性简写。
// bad 
const lukeSkywalker = 'Luker Skywalker';

// bad
const obj = {
  lukeSkywalker: lukeSkywalker
};

// good
const obj = {
  lukeSkywalker
};


3.7 在对象属性生命前把简写的属性分组。
const anakinSkywalker = 'Anakin Skywalker';
const lukeSkywalker = 'Luke Skywalker';

// bad 
const obj = {
  episodeOne: 1,
  twoJedisWalkIntoACantina: 2,
  lukeSkywalker,
  episodeThree: 3,
  mayTheFourth: 4,
  anakinSkywalker,
};

// good
const obj = {
  lukeSkywalker,
  anakinSkywalker,
  episodeOne: 1,
  twoJedisWalkIntoACantina: 2,
  episodeThree: 3,
  mayTheFourth: 4,
};
```

## 4. 数组
```javascript
4.3 使用拓展运算符 ... 复制数组。
// bad 
const len = items.length;
const itemsCopy = [];
let i;
 

for (i = 0; i < len; i++) {
  itemsCopy[i] = items[i];
}
 

// good
const itemsCopy = [...items];



4.4 使用 Array#from 把一个类数组对象转换成数组。
const foo = document.querySelectorAll('.foo');
const nodes = Array.from(foo);
```

## 5. 解构
```javascript
5.1 使用解构存取和使用多属性对象。
// bad
function getFullName(user) {
  const firstName = user.firstName;
  const lastName = user.lastName;
 

  return `${firstName} ${lastName}`;
}
 

// good
function getFullName(obj) {
  const { firstName, lastName } = obj;
  return `${firstName} ${lastName}`;
}
 

// best
function getFullName({ firstName, lastName }) {
  return `${firstName} ${lastName}`;
}



5.2 对数组使用解构赋值。
const arr = [1, 2, 3, 4];
 

// bad
const first = arr[0];
const second = arr[1];
 

// good
const [first, second] = arr;



5.3 需要回传多个值时，使用对象解构，而不是数组解构。
// bad
function processInput(input) {
  // then a miracle occurs
  return [left, right, top, bottom];
}
 

// 调用时需要考虑回调数据的顺序。
const [left, __, top] = processInput(input);
 

// good
function processInput(input) {
  // then a miracle occurs
  return { left, right, top, bottom };
}
 

// 调用时只选择需要的数据
const { left, right } = processInput(input);
```

## 6. 字符串
```javascript
6.2 字符串超过 80 个字节应该使用字符串连接号换行。



6.3 注：过度使用字串连接符号可能会对性能造成影响。jsPerf 和 讨论.
// bad
const errorMessage = 'This is a super long error that was thrown because of Batman. When you stop to think about how Batman had anything to do with this, you would get nowhere fast.';
 

// bad
const errorMessage = 'This is a super long error that was thrown because \
of Batman. When you stop to think about how Batman had anything to do \
with this, you would get nowhere \
fast.';
 

// good
const errorMessage = 'This is a super long error that was thrown because ' +
  'of Batman. When you stop to think about how Batman had anything to do ' +
  'with this, you would get nowhere fast.';



6.4 程序化生成字符串时，使用模板字符串代替字符串连接。
// bad
function sayHi(name) {
  return 'How are you, ' + name + '?';
}
 

// bad
function sayHi(name) {
  return ['How are you, ', name, '?'].join();
}
 

// good
function sayHi(name) {
  return `How are you, ${name}?`;
}
```

## 7. 函数
```javascript
7.5 永远不要把参数命名为 arguments。这将取代原来函数作用域内的 arguments 对象。
// bad
function nope(name, options, arguments) {
  // ...stuff...
}
 

// good
function yup(name, options, args) {
  // ...stuff...
}



7.6 不要使用 arguments。可以选择 rest 语法 ... 替代。
// bad
function concatenateAll() {
  const args = Array.prototype.slice.call(arguments);
  return args.join('');
}
 

// good
function concatenateAll(...args) {
  return args.join('');
}



7.7 直接给函数的参数指定默认值，不要使用一个变化的函数参数。
// really bad
function handleThings(opts) {
  // 不！我们不应该改变函数参数。
  // 更加糟糕: 如果参数 opts 是 false 的话，它就会被设定为一个对象。
  // 但这样的写法会造成一些 Bugs。
  //（译注：例如当 opts 被赋值为空字符串，opts 仍然会被下一行代码设定为一个空对象。）
  opts = opts || {};
  // ...
}
 

// still bad
function handleThings(opts) {
  if (opts === void 0) {
    opts = {};
  }
  // ...
}
 

// good
function handleThings(opts = {}) {
  // ...
}
```

## 8. 箭头函数
```javascript
8.2 如果一个函数适合用一行写出并且只有一个参数，那就把花括号、圆括号和 return 都省略掉。如果不是，那就不要省略。
// good
[1, 2, 3].map(x => x * x);
 

// good
[1, 2, 3].reduce((total, n) => {
  return total + n;
}, 0);
```

## 9. 构造函数
```javascript
9.1 总是使用 class。避免直接操作 prototype 。
// 为什么? 因为 class 语法更为简洁更易读。
 

// bad
function Queue(contents = []) {
  this._queue = [...contents];
}
Queue.prototype.pop = function() {
  const value = this._queue[0];
  this._queue.splice(0, 1);
  return value;
}
 

// good
class Queue {
  constructor(contents = []) {
    this._queue = [...contents];
  }
  pop() {
    const value = this._queue[0];
    this._queue.splice(0, 1);
    return value;
  }
}



9.2 使用 extends 继承。
// 为什么？因为 extends 是一个内建的原型继承方法并且不会破坏 instanceof。
 

// bad
const inherits = require('inherits');
function PeekableQueue(contents) {
  Queue.apply(this, contents);
}
inherits(PeekableQueue, Queue);
PeekableQueue.prototype.peek = function() {
  return this._queue[0];
}
 

// good
class PeekableQueue extends Queue {
  peek() {
    return this._queue[0];
  }
}



9.3 方法可以返回 this 来帮助链式调用。
 

// bad
Jedi.prototype.jump = function() {
  this.jumping = true;
  return true;
};
 

Jedi.prototype.setHeight = function(height) {
  this.height = height;
};
 

const luke = new Jedi();
luke.jump(); // => true
luke.setHeight(20); // => undefined
 

// good
class Jedi {
  jump() {
    this.jumping = true;
    return this;
  }
 

  setHeight(height) {
    this.height = height;
    return this;
  }
}
 

const luke = new Jedi();
 

luke.jump()
  .setHeight(20);



9.4 可以写一个自定义的 toString() 方法，但要确保它能正常运行并且不会引起副作用。
 

class Jedi {
  constructor(options = {}) {
    this.name = options.name || 'no name';
  }
 

  getName() {
    return this.name;
  }
 

  toString() {
    return `Jedi - ${this.getName()}`;
  }
}
```

## 10. 模块
```javascript
10.1 总是使用模组 (import/export) 而不是其他非标准模块系统。你可以编译为你喜欢的模块系统。
 

// bad
const AirbnbStyleGuide = require('./AirbnbStyleGuide');
module.exports = AirbnbStyleGuide.es6;
 

// ok
import AirbnbStyleGuide from './AirbnbStyleGuide';
export default AirbnbStyleGuide.es6;
 

// best
import { es6 } from './AirbnbStyleGuide';
export default es6;



10.2 不要使用通配符 import。
// 为什么？这样能确保你只有一个默认 export。
 

// bad
import * as AirbnbStyleGuide from './AirbnbStyleGuide';
 

// good
import AirbnbStyleGuide from './AirbnbStyleGuide';
```

## 13. 变量
```javascript
13.3 将所有的 const 和 let 分组
// 为什么？当你需要把已赋值变量赋值给未赋值变量时非常有用。
 

// bad
let i, len, dragonball,
items = getItems(),
goSportsTeam = true;
 

// bad
let i;
const items = getItems();
let dragonball;
const goSportsTeam = true;
let len;
 

// good
const goSportsTeam = true;
const items = getItems();
let dragonball;
let i;
let length;



13.4 在你需要的地方给变量赋值，但请把它们放在一个合理的位置。
// 为什么？let 和 const 是块级作用域而不是函数作用域。
 

// good
function() {
  test();
  console.log('doing stuff..');
 

  //..other stuff..
 

  const name = getName();
 

  if (name === 'test') {
    return false;
  }
 

  return name;
}
 

// bad - unnecessary function call
function(hasName) {
  const name = getName();
 

  if (!hasName) {
    return false;
  }
 

  this.setFirstName(name);
 

  return true;
}
 

// good
function(hasName) {
  if (!hasName) {
    return false;
  }
 

  const name = getName();
  this.setFirstName(name);
 

  return true;
}
```

## 14. 提升
```javascript
14.1 var 声明会被提升至该作用域的顶部，但它们赋值不会提升。let 和 const 被赋予了一种称为「暂时性死区（Temporal Dead Zones, TDZ）」的概念。这对于了解为什么 type of 不再安全相当重要。
 

// 我们知道这样运行不了 
// （假设 notDefined 不是全局变量）
function example() {
  console.log(notDefined); // => throws a ReferenceError
}
 

// 由于变量提升的原因，
// 在引用变量后再声明变量是可以运行的。
// 注：变量的赋值 `true` 不会被提升。
function example() {
  console.log(declaredButNotAssigned); // => undefined
  var declaredButNotAssigned = true;
}
 

// 编译器会把函数声明提升到作用域的顶层，
// 这意味着我们的例子可以改写成这样：
function example() {
  let declaredButNotAssigned;
  console.log(declaredButNotAssigned); // => undefined
  declaredButNotAssigned = true;
}
 

// 使用 const 和 let
function example() {
  console.log(declaredButNotAssigned); // => throws a ReferenceError
  console.log(typeof declaredButNotAssigned); // => throws a ReferenceError
  const declaredButNotAssigned = true;
}



14.2 匿名函数表达式的变量名会被提升，但函数内容并不会。
 

function example() {
  console.log(anonymous); // => undefined
 

  anonymous(); // => TypeError anonymous is not a function
 

  var anonymous = function() {
    console.log('anonymous function expression');
  };
}



14.4 函数声明的名称和函数体都会被提升。
 

function example() {
  superPower(); // => Flying
 

  function superPower() {
    console.log('Flying');
  }
}
```

## 15. 比较运算符 &AudioParamMap; 等号
```javascript
15.1 有限使用 === 和 !== 而不是 == 和 != .



15.2 条件表达式例如 if 语句通过抽象方法 ToBoolean 强制计算他们的表达式并且总是遵守下面的规则：
// 对象 被计算为 true
// Undefined 被计算为 false
// Null 被计算为 false
// 布尔值 被计算为 布尔的值
// 数字 如果是 +0、-0、或 NaN 被计算为 false, 否则为 true
// 字符串 如果是空字符串 '' 被计算为 false，否则为 true
 

if ([0]) {
  // true
  // An array is an object, objects evaluate to true
}



15.3 使用简写。
 

// bad
if (name !== '') {
  // ...stuff...
}
 

// good
if (name) {
  // ...stuff...
}
 

// bad
if (collection.length > 0) {
  // ...stuff...
}
 

// good
if (collection.length) {
  // ...stuff...
}
```

## 16. 代码块
```javascript
16.1 使用大括号包裹所有的多行代码块。
 

// bad
if (test)
  return false;
 

// good
if (test) return false;
 

// good
if (test) {
  return false;
}
 

// bad
function() { return false; }
 

// good
function() {
  return false;
}



16.2 如果通过 if 和 else 使用多行代码块，把 else 放在 if 代码块关闭括号的同一行。
 

// bad
if (test) {
  thing1();
  thing2();
}
else {
  thing3();
}
 

// good
if (test) {
  thing1();
  thing2();
} else {
  thing3();
}
```

## 17. 注释
```javascript
17.2 使用 // 作为单行注释。在评论对象上面另起一行使用单行注释。在注释前插入空行。
 

// bad
const active = true;  // is current tab
 

// good
// is current tab
const active = true;
 

// bad
function getType() {
  console.log('fetching type...');
  // set the default type to 'no type'
  const type = this._type || 'no type';
 

  return type;
}
 

// good
function getType() {
  console.log('fetching type...');
 

  // set the default type to 'no type'
  const type = this._type || 'no type';
 

  return type;
}



17.4 使用 // FIXME: 标注问题。
 

class Calculator {
  constructor() {
    // FIXME: shouldn't use a global here
    total = 0;
  }
}



17.5 使用 // TODO: 标注问题的解决方式。
 

class Calculator {
  constructor() {
    // TODO: total should be configurable by an options param
    this.total = 0;
  }
}
```

## 18. 空白
```javascript
18.1 使用 2 个空格作为缩进。
 

// bad
function() {
∙∙∙∙const name;
}
 

// bad
function() {
∙const name;
}
 

// good
function() {
∙∙const name;
}



18.2 在花括号前放一个空格。
 

// bad
function test(){
  console.log('test');
}
 

// good
function test() {
  console.log('test');
}
 

// bad
dog.set('attr',{
  age: '1 year',
  breed: 'Bernese Mountain Dog',
});
 

// good
dog.set('attr', {
  age: '1 year',
  breed: 'Bernese Mountain Dog',
});



18.3 在控制语句（if、while 等）的小括号前放一个空格。在函数调用及声明中，不在函数的参数列表前加空格。
 

// bad
if(isJedi) {
  fight ();
}
 

// good
if (isJedi) {
  fight();
}
 

// bad
function fight () {
  console.log ('Swooosh!');
}
 

// good
function fight() {
  console.log('Swooosh!');
}



18.5 在文件末尾插入一个空行。
 

// bad
(function(global) {
  // ...stuff...
})(this);



// bad
(function(global) {
  // ...stuff...
})(this);↵
↵



// good
(function(global) {
  // ...stuff...
})(this);↵



18.5 在使用长方法链时进行缩进。使用前面的点 . 强调这是方法调用而不是新语句。
 

// bad
$('#items').find('.selected').highlight().end().find('.open').updateCount();
 

// bad
$('#items').
  find('.selected').
    highlight().
    end().
  find('.open').
    updateCount();
 

// good
$('#items')
  .find('.selected')
    .highlight()
    .end()
  .find('.open')
    .updateCount();
 

// bad
const leds = stage.selectAll('.led').data(data).enter().append('svg:svg').class('led', true)
    .attr('width', (radius + margin) * 2).append('svg:g')
    .attr('transform', 'translate(' + (radius + margin) + ',' + (radius + margin) + ')')
    .call(tron.led);
 

// good
const leds = stage.selectAll('.led')
    .data(data)
  .enter().append('svg:svg')
    .classed('led', true)
    .attr('width', (radius + margin) * 2)
  .append('svg:g')
    .attr('transform', 'translate(' + (radius + margin) + ',' + (radius + margin) + ')')
    .call(tron.led);
 

19. 逗号
 

19.2 增加结尾的逗号: 需要。
// 为什么? 这会让 git diffs 更干净。另外，像 babel 这样的转译器会移除结尾多余的逗号，也就是说你不必担心老旧浏览器的尾逗号问题。
 

// bad - git diff without trailing comma
const hero = {
  firstName: 'Florence',
-    lastName: 'Nightingale'
+    lastName: 'Nightingale',
+    inventorOf: ['coxcomb graph', 'modern nursing']
}
 

// good - git diff with trailing comma
const hero = {
  firstName: 'Florence',
  lastName: 'Nightingale',
+    inventorOf: ['coxcomb chart', 'modern nursing'],
}
 

// bad
const hero = {
firstName: 'Dana',
lastName: 'Scully'
};
 

const heroes = [
'Batman',
'Superman'
];
 

// good
const hero = {
firstName: 'Dana',
lastName: 'Scully',
};
 

const heroes = [
'Batman',
'Superman',
];
```

## 21. 转化类型
```javascript
21.1 在语句开始时执行类型转换。



21.2 字符串：
 

//  => this.reviewScore = 9;
 

// bad
const totalScore = this.reviewScore + '';
 

// good
const totalScore = String(this.reviewScore);




21.3 对数字使用 parseInt 转换，并带上类型转换的基数。
 

const inputValue = '4';
 

// bad
const val = new Number(inputValue);
 

// bad
const val = +inputValue;
 

// bad
const val = inputValue >> 0;
 

// bad
const val = parseInt(inputValue);
 

// good
const val = Number(inputValue);
 

// good
const val = parseInt(inputValue, 10);



21.4 如果因为某些原因 parseInt 成为你所做的事的瓶颈而需要使用位操作解决性能问题时，留个注释说清楚原因和你的目的。
 

// good
/**
 * 使用 parseInt 导致我的程序变慢，
 * 改成使用位操作转换数字快多了。
 */
const val = inputValue >> 0;



21.6 布尔:
 

const age = 0;
 

// bad
const hasAge = new Boolean(age);
 

// good
const hasAge = Boolean(age);
 

// good
const hasAge = !!age;
```

## 22. 命名规则
```javascript
22.3 使用帕斯卡式命名构造函数或类
 

// bad
function user(options) {
  this.name = options.name;
}
 

const bad = new user({
  name: 'nope',
});
 

// good
class User {
  constructor(options) {
    this.name = options.name;
  }
}
 

const good = new User({
  name: 'yup',
});



22.4 使用下划线 _ 开头命名私有属性。
 

// bad
this.__firstName__ = 'Panda';
this.firstName_ = 'Panda';
 

// good
this._firstName = 'Panda';



22.5 别保存 this 的引用。使用箭头函数或 Function#bind。
 

// bad
function foo() {
  const self = this;
  return function() {
    console.log(self);
  };
}
 

// bad
function foo() {
  const that = this;
  return function() {
    console.log(that);
  };
}
 

// good
function foo() {
  return () => {
    console.log(this);
  };
}



22.6 如果你的文件只输出一个类，那你的文件名必须和类名完全保持一致。
 

// file contents
class CheckBox {
  // ...
}
export default CheckBox;
 

// in some other file
// bad
import CheckBox from './checkBox';
 

// bad
import CheckBox from './check_box';
 

// good
import CheckBox from './CheckBox';



22.7 当你导出默认的函数时使用驼峰式命名。你的文件名必须和函数名完全保持一致。
 

function makeStyleGuide() {
}
 

export default makeStyleGuide;



22.8 当你导出单例、函数库、空对象时使用帕斯卡式命名。
 

const AirbnbStyleGuide = {
  es6: {
  }
};
 

export default AirbnbStyleGuide;
```

## 23. 存取器
```javascript
23.1 属性的存取函数不是必须的



23.2 如果你需要存取函数时使用 getVal() 和 setVal('hello')。
 

// bad
dragon.age();
 

// good
dragon.getAge();
 

// bad
dragon.age(25);
 

// good
dragon.setAge(25);



23.3 如果属性是布尔值，使用 isVal() 或 hasVal()。
 

// bad
if (!dragon.age()) {
  return false;
}
 

// good
if (!dragon.hasAge()) {
  return false;
}



23.4 创建 get() 和 set() 函数是可以的，但要保持一致。
 

class Jedi {
  constructor(options = {}) {
    const lightsaber = options.lightsaber || 'blue';
    this.set('lightsaber', lightsaber);
  }
 

  set(key, val) {
    this[key] = val;
  }
 

  get(key) {
    return this[key];
  }
}
```

## 25. jQuery
```javascript
25.1 使用 $ 作为存储 jQuery 对象的变量名前缀。
 

// bad
const sidebar = $('.sidebar');
 

// good
const $sidebar = $('.sidebar');



25.2 缓存 jQuery 查询。
 

// bad
function setSidebar() {
  $('.sidebar').hide();
 

  // ...stuff...
 

  $('.sidebar').css({
    'background-color': 'pink'
  });
}
 

// good
function setSidebar() {
  const $sidebar = $('.sidebar');
  $sidebar.hide();
 

  // ...stuff...
 

  $sidebar.css({
    'background-color': 'pink'
  });
}



25.3 对 DOM 查询使用层叠 $('.sidebar ul') 或 父元素 > 子元素 $('.sidebar > ul')。



25.4 对有作用域的 jQuery 对象查询使用 find。
 

// bad
$('ul', '.sidebar').hide();
 

// bad
$('.sidebar').find('ul').hide();
 

// good
$('.sidebar ul').hide();
 

// good
$('.sidebar > ul').hide();
 

// good
$sidebar.find('ul').hide();
```