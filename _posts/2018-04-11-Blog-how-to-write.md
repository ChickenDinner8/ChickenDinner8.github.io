---
layout: post
title: 项目博客撰写简易指南
tags: blog
---

15331321-wyr

1、 首先使用工具把我们的[仓库](https://github.com/ChickenDinner8/ChickenDinner8.github.io)clone到本地

2、 打开仓库下的_post文件夹，以年-月-日-标题.md的形式创建你的markdown文件，在建立好的markdown文件的开头，你需要插入下列元信息供Jekyll使用（不要漏了短横线）：
```
---
layout: post  #这个不能变
title: 你的标题 #标题在这里写就行了，不需要在正文里再写一遍
 tags : blog  #若是文档则写document
---
```

3、如果需要使用图片，请复制一份到仓库下的public/img文件夹下，这里推荐为你的博客另起一个文件夹；另外，添加目录需要在正文开头增加下列两行代码
```
* toc
{:toc}
```

4、（可选）推荐在你的电脑本地安装一个[Jekyll](https://jekyllrb.com/docs/installation/)，安装好后在仓库的根目录下运行jekyll serve，然后在浏览器打开localhost:4000观察效果

5、检查好markdown文档后，使用工具把新的仓库推送到Github上，等个一两分钟，就能上[项目主页](https://chickendinner8.github.io/)看你写好的博客了

最后，如果你（小组成员）有任何特殊的配置需求，可以到[官方文档](https://jekyllrb.com/docs/home/)上查阅资料，或者与我联系
