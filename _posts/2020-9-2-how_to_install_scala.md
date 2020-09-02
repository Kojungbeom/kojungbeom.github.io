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





