---
title:  How to install SCALA
excerpt: SCALA 다운로드 방법
date: 2020-09-02 12:00:00
categories:
  - Installation
tags:
  - Installation
lastmod : 2020-09-02 12:00:00
---

# INSTALL SCALA

#### 1. Download `tar.gz` file

 https://www.scala-lang.org/download/install.html



#### 2. Extract File

```
$ tar xvf scala-2.x.x.tgz
```



#### 3. Move Scala folder

```
$ mv scala-2.x.x /usr/local/share/scala
```



#### 4. Set Environment Variable

```
$ vim .bashrc
```

```
$ export SCALA_HOME=/usr/local/share/scala
$ export PATH=$PATH:$SCALA_HOME/bin
```

```
$ source .bashrc
```



#### 5. Restart Terminal and Check version

```
$ scala --version
```





