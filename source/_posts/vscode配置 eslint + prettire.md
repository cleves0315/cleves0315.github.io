---
title: vscode配置 eslint + prettire
tags: []
id: '28'
categories:
  - - 创作
date: 2022-03-07 23:51:00
permalink: /archives/28/
---

## 前言

> 一直以来在项目开发上对 eslint 和 prettire 的了解都是片面的。只知道eslint是规范代码，prettire是格式化代码，没有深入了解过怎么配置它们。
> 

本文是从零开始在vscode用 webpack 配置 eslint + prettire

## eslint

在vscode插件搜索 eslint 安装

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dfbfb120-0411-427e-9457-c4fffcb238dc/Untitled.png)

然后npm 安装 eslint

```jsx
npm install --save-dev eslint
```

到这之后安装阶段就完成了，开始配置。

项目根目录创建 .eslintrc 文件，配置对应的规则内容，这里我直接继承 react-app

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f5a777e6-bf86-439d-8cd9-98f5b9739aee/Untitled.png)

安装完eslint插件，npm安装完eslint加上.eslintrc文件，此刻你的vscode已经可以开始工作了（此刻只是检查代码，并不会自动格式化）。

## ****Prettier****

vscode商店搜索 ****Prettier**** 并安装

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bc11ee96-2b2f-4abe-a5f4-8f4867164c46/Untitled.png)

项目上 npm 安装 ****Prettier**** 再添加 .prettierrc 配置文件加上你需要格式化的规则

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6d37ccb5-6a77-44ad-a636-55d483b2e690/Untitled.png)

到了这步后你可能并不会起效果，发现 Ctrl+S 后还是不能格式化？？？

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2f855eee-4756-49da-ae40-2c4fcc2aae22/Untitled.png)

到项目根目录新建一个 .vscode/settings.json 文件(在你的vscode全局配置文件配置也行，在项目上添加只是保证运行这个项目的人都能读到这个配置)

添加配置：

```json
{
  // 开启保存自动格式化
  "editor.formatOnSave": true
}
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2b9370be-e813-42f7-bff2-d44ad77cf195/Untitled.png)

此刻你的代码****Prettier****功能就实现了。