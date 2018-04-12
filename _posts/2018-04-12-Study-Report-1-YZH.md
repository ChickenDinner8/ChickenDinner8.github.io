---
layout: post
title: Vue学习笔记（一）
tags: blog
---

15331370-yzh

由于系分课程项目的需要，最近学习了一些基于Vue前端开发的知识，这也是本人学习的一个框架，因此记录下学习过程的点点滴滴。

## 什么是Vue？

这里我引用官方的一段作为解释。

> Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。

对比起angular、react、knockout等框架，Vue算是后起之秀，相对容易上手，而且由于国人参与开发，学习过程有着不少资料能够借鉴，这也是我们团队选择这个框架的原因之一。

## 环境搭建

Vue的环境搭建有两种方式，其中最为简单就是直接通过CDN引入Vue，这个只需要在添加这样的一个<script>标签。

```html
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
```

而在构建大型应用时则推荐使用NPM安装，开始时我个人使用的是CDN引入，但随着项目功能的增多，开始受到制约，因此改用了NPM并引入了Vue-cli的框架，下面主要介绍Vue-cli框架的搭建过程。

1. NPM的安装
   如果本身具有Node.js可直接跳过这一步，因为下载Node.js时会默认下载NPM，如果没有Node.js可以官方网站进行下载:[<https://www.npmjs.com/>]()

2. 安装淘宝镜像
   在命令行中输入

   ```shell
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   ```

3. 安装Vue-cli
   Mac安装在命令行输入：

   ```shell
   sudo npm install -g vue-cli
   ```

   Windows在命令行安装输入：

   ```shell
   npm install -g vue-cli
   ```

4. 构建初始化项目
   在命令行中输入：

   ```shell
   vue init webpack project
   ```

   其中，project为具体项目的名称。

5. 安装依赖
   进入到项目目录后在命令行输入：

   ```shell
   npm install
   ```

6. 项目运行

   在命令行中输入：

   ```shell
   npm run dev
   ```

7. 其他库的安装

   在本次系分项目中，我们决定使用iview来进行UI的编写，因此需要引入iview，可在命令行中输入：

   ```shell
   npm install vue-router iview --save
   ```

8. 最后对项目进行打包

   在命令行中输入：

   ```shell
   npm run build
   ```

到这里，我们便完成了我们Vue项目的环境搭建。