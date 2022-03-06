---
title: 解锁：在hooks下使用mobx
tags: []
id: '27'
categories:
  - - 创作
date: 2022-03-06 21:22:00
permalink: /archives/27/
---

<!-- # 解锁：在hooks下使用mobx -->

> 一般我们在使用mobx的时候都是在class组件使用，这段时间我突然就想在hooks下使用它，并在cdp项目中如期使用了，也亲身试验过没有坑，这里做了一个分享。
<!--more-->
# 目前研究出了2种方式：

### 1. 用Taro开发的方式，直接引入

```
import Store from './store' // 直接引入store

function Demo() {
    ....

    ....

    return (
      <div>{Store.data}</div>
    )
}
```

但是这种方式在我们pc的项目上不符合开发规范（pc项目都是统一抛出，用inject注入到class里）

### 2. 使用mobx-react-lite (针对mobx@5版本)

```
// import { inject, observer } from 'mobx-react';
import { inject } from 'mobx-react';
import { observer } from "mobx-react-lite";

const Index = observer(({
  Store
}) => {
  ...

  return (
    <div>
      {Store.data}
    </div>
  )
})

export default inject('Store')(Index);
```

通过以上的方式，就可以和class组件一样，通过注入的形式获取到store，并使用。

### 为什么针对mobx@5版本？

我观察了一下我们的pc项目的mobx、mobx-react版本基本是5.x.x

官方文档里描述到：

在v5版本中，不支持hooks的使用，但可以借助 mobx-react-lite

<img src="/images/2022-03-06222900.png" />


[mobx官方](https://github.com/mobxjs/mobx-react)

# 补充：

### 1. 有小伙伴说，在pc项目无法使用hooks方式开发。

**！！！先关注下项目的react版本，hooks最低兼容版本在16.8**

**！！！先关注下项目的react版本，hooks最低兼容版本在16.8**

**！！！先关注下项目的react版本，hooks最低兼容版本在16.8**

<img src="/images/2022-03-06221500.png" />

### 2. 如何引入多个Store对象

```
// import { inject, observer } from 'mobx-react';
import { inject } from 'mobx-react';
import { observer } from "mobx-react-lite";

const Index = observer(({
  Store1,
  Store2
}) => {
  ...

  return (
    <div>
      {Store1.data}
      {Store2.data}
    </div>
  )
})

// 用逗号分隔多个store名称
export default inject('Store1', 'Store2')(Index);
```

在观察了 **mobx v5** 版本中的源码，它的inject方法采用了展开操作符，那我们入参就用逗号分隔多个store传入即可。

![https://cdn.nlark.com/yuque/0/2022/png/21642970/1646317456473-6d0b89b1-4bf1-4e41-93e6-ea6965941b01.png](https://cdn.nlark.com/yuque/0/2022/png/21642970/1646317456473-6d0b89b1-4bf1-4e41-93e6-ea6965941b01.png)

### 3. 配合公司组件库ezrd的form组件一起使用

```
// import { inject, observer } from 'mobx-react';
import { inject } from 'mobx-react';
import { observer } from "mobx-react-lite";
import { Form } from 'ezrd';

const { createForm } = Form;

const Index = observer(({
  Store
}) => {
  ...

  return (
    <div>
      {Store.data}
    </div>
  )
})

// 先插入Store再嵌入Form组件中
const injectIndex = inject('Store')(Index);
const WrappedForm = createForm()(injectIndex);

export default WrappedForm;
```