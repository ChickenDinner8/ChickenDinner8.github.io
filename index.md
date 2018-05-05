---
layout: default
title: Home
---

<div class="main-wrapper">
  <div class="main-content">
    <h1>
      Eat点点
    </h1>
    <h2>
      扫码点餐系统
    </h2>
    <div class="main-content-images">
      <div>
        <img src="https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/lun/kitchen-29322.png" />
      </div>
      <div>
        <img src="https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/lun/eat-1299323.png" />
      </div>
      <div>
        <img src="https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/lun/coffee-3064397.png" />
      </div>
      <div>
        <img src="https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/lun/cherry-105141.png" />
      </div>
    </div>
  </div>
</div>


<div class="posts">
    <h1>
      文档目录
    </h1>
  {% assign posts = site.posts | sort: 'title' %}
  {% for post in posts %}
  {% if post.tags contains 'document' %}
  <div class="post">
    <h2 class="post-title">
      <a href="{{ post.url }}">
        {{ post.title }}
      </a>
    </h2>

  </div>
  {% endif %}
  {% endfor %}
</div>

<div markdown="1">

### markdown 测试

1. fuck
2. shit
3. bitch

</div>
