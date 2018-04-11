
---

#### 简介
Travis CI是一个在线的，分布式的服务。通过Travis，我们能够对Github上的项目进行持续集成（CI）和持续部署（CD）

#### 使用流程
1、Travis支持使用Github账号登录。在进入Travis官网（https://travis-ci.org/）后，点击signin with Github的按钮，登录后添加需要进行CI/CD的仓库。
![登录][1]


2、登录到Github，在被添加的仓库上添加新文件 .travis.yml，根据官方文档进行基础配置，如编程语言，运行环境等。这里用一个Django的项目作为例子：
```
os: linux

language: python
python: '3.6'

install:
    - pip install Django
    - pip install Pillow
    - pip install mysqlclient
    - pip install pytz

```
![添加仓库][2]
3、完成基础配置后，可以添加集成测试，由于Django本身提供了测试功能，所以这里只需要添加少量代码
```
script:
  - python3 manage.py test
```
4、写好集成测试的脚本后，把.travis.yml文件推送到GitHub，不久后Travis就会开始进行CI，此时登陆到Travis的网站上可以看到它的Job Log（感兴趣的同学可以点一下那个build passing图标把它复制到你的项目主页上-。-）
![运行日志][3]
5、至此CI已经做好了，但是Travis还提供了部署功能，不用白不用。遗憾的是目前（2018年4月）Travis还没有与国内的云服务器进行对接，所以我们只能手动ssh到自己的云服务器上用脚本进行部署，部署脚本（deploy.sh)的代码如下：
```
#! /bin/bash
cd /home/ubuntu/ChickenDinner/Server && git pull
nohup python3 /home/ubuntu/ChickenDinner/Server/manage.py runserver 0.0.0.0:8000 > nohup.out 2> nohup.err < /dev/null &
#注意nohup的写法，必须加&后台执行，同时把3个IO重定向，不然通过ssh执行脚本时会一直挂起
```

6、把ssh要用的密钥上传到Travis上比较麻烦，这里图省事使用sshpass工具，为此需要在.travis.yml文件添加下列代码：
```
sudo: required

before_install:
    - sudo apt-get install -y sshpass
```

7、为了安全起见，把密码和服务器IP等私密信息以环境变量的形式存储到Travis上（默认不公开）。在Travis界面中点击More options里的setting，在设置里添加SSH_PASS等环境变量
![设置][4]

![环境变量][5]

8、在.travis.yml文件添加部署代码，为了不让ssh交互式地询问是否信任并添加host，直接把服务器IP添加到ssh_known_hosts：
```
addons:
  ssh_known_hosts: XXX.XXX.XXX.XXX

after_success:
  - export SSHPASS=$SSH_PASS
  - sshpass -e ssh $MY_SERVER /home/ubuntu/ChickenDinner/deploy.sh
```

9、至此Travis的CI/CD已配置完成，整个Django项目的.travis.yml文件如下所示：
```
os: linux
sudo: required

language: python
python: '3.6'

addons:
  ssh_known_hosts: xxx.xxx.xxx.xxx

before_install:
    - sudo apt-get install -y sshpass

install:
    - pip install Django
    - pip install Pillow
    - pip install mysqlclient
    - pip install pytz

script: python3 manage.py test

after_success:
  - export SSHPASS=$SSH_PASS
  - sshpass -e ssh $MY_SERVER /home/ubuntu/ChickenDinner/deploy.sh
```

#### 参考链接
[Travis官方文档](https://docs.travis-ci.com/)

[sshpass的用法](https://linux.die.net/man/1/sshpass)

[通过ssh执行nohup的注意事项](https://askubuntu.com/questions/349262/run-a-nohup-command-over-ssh-then-disconnect)


  [1]: https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/travis-how-to-use/login.PNG
  [2]: https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/travis-how-to-use/add%20repo.PNG
  [3]: https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/travis-how-to-use/log.PNG
  [4]: https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/travis-how-to-use/setting.PNG
  [5]: https://raw.githubusercontent.com/ChickenDinner8/ChickenDinner8.github.io/master/public/img/travis-how-to-use/env_var.PNG