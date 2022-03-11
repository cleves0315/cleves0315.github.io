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
<!--more-->

本文是从零开始在vscode用 webpack 配置 eslint + prettire

## eslint

在vscode插件搜索 eslint 安装

![Untitled](/images/202203072354.png)

然后npm 安装 eslint

```jsx
npm install --save-dev eslint
```

到这之后安装阶段就完成了，开始配置。

项目根目录创建 .eslintrc 文件，配置对应的规则内容，这里我直接继承 react-app

![Untitled](/images/202203072355.png)

安装完eslint插件，npm安装完eslint加上.eslintrc文件，此刻你的vscode已经可以开始工作了（此刻只是检查代码，并不会自动格式化）。

## ****Prettier****

vscode商店搜索 ****Prettier**** 并安装

![Untitled](/images/202203072356.png)

项目上 npm 安装 ****Prettier**** 再添加 .prettierrc 配置文件加上你需要格式化的规则

![Untitled](/images/202203072357.png)

到了这步后你可能并不会起效果，发现 Ctrl+S 后还是不能格式化？？？

![Untitled](/images/202203072358.png)

到项目根目录新建一个 .vscode/settings.json 文件(在你的vscode全局配置文件配置也行，在项目上添加只是保证运行这个项目的人都能读到这个配置)

添加配置：

```json
{
  // 开启保存自动格式化
  "editor.formatOnSave": true
}
```

![Untitled](/images/202203072359.png)

此刻你的代码****Prettier****功能就实现了。