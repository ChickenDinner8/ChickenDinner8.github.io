系统分析与设计课程项目技术分享博客

团队：ChickenDinner8

作者：吴博文

---

[我的博客传送门](https://bowenwu1.github.io/2018/04/12/%E5%85%B3%E4%BA%8EMac%E9%85%8D%E7%BD%AEMySQLClient%E9%81%87%E5%88%B0%E7%9A%84%E5%9D%91/)

我们小组所确定的技术方案是Python + Django + MySQL，而我的本地环境是MacOS

配置过程如下：

```shell
pip3 install django
# 安装MySQL驱动
brew install mysql-connector-c
pip3 install mysqlclient
```

Django是安装成功了，但是mysqlclient就报了以下错误：

```shell
Collecting mysqlclient
  Using cached mysqlclient-1.3.10.tar.gz
    Complete output from command python setup.py egg_info:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File "/private/var/folders/rv/a_a/T/pip-build-nyaa8t95/mysqlclient/setup.py", line 17, in <module>
        metadata, options = get_config()
      File "/private/var/folders/rv/a_a/T/pip-build-nyaa8t95/mysqlclient/setup_posix.py", line 54, in get_config
        libraries = [dequote(i[2:]) for i in libs if i.startswith('-l')]
      File "/private/var/folders/rv/a_a/T/pip-build-nyaa8t95/mysqlclient/setup_posix.py", line 54, in <listcomp>
        libraries = [dequote(i[2:]) for i in libs if i.startswith('-l')]
      File "/private/var/folders/rv/a_a/T/pip-build-nyaa8t95/mysqlclient/setup_posix.py", line 12, in dequote
        if s[0] in "\"'" and s[0] == s[-1]:
    IndexError: string index out of range
```

我是一脸懵逼的，随后上网搜索，逛了很久发现有不少人跟我有一样的问题，这问题挺迷的。我参考了[一场由mysql官方引发的python血案](https://www.easegamer.com/?p=545) 然后发现这个解决方案的源头是在mysql的Issue下的 [pip3 install mysqlclient fails on macOS](https://github.com/PyMySQL/mysqlclient-python/issues/169#issuecomment-299778504)

说来尴尬，mysqlclient的开发者是这样回答的：

> 这是Oracle制造的Bug，但是大家都来找mysqlclient了

解决方法如下：

首先找出config文件：

```shell
cd /usr/local/Cellar/mysql-connector-c/6.1.11/bin 
```

首先在修改之前备份我们想要修改的文件（以免搞坏了弄不回去了）

```shell
cp  mysql_config mysql_config.backup
```

将mysql_config文件中114行的：

```shell
libs="$libs -l "
```

替换为：

```shell
libs="$libs -lmysqlclient -lssl -lcrypto"
```

之后再重新安装mysqlclient就可以成功了