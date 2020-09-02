---
title:  "모르는 용어 정리(계속 수정)"
excerpt: "몰랐던 용어들을 정리하자"
date: 2020-3-21 12:00:00
categories:
  - Information
tags:
  - Information
lastmod : 2020-3-27 12:00:00
sitemap :
changefreq : daily
priority : 1.0
---

#모르는 용어 정리(계속해서 추가)



# Namespace

c++에서 사용되는, 소속을 알리는 역할. 예를들어 철수네 강아지도 진우고, 영희네 강아지도 진우일 때, 

이름이 같기때문에 구분이 안되는걸 막기위해서 Namespace를 사용합니다.

-> Namespace == 소속 공간 (DB의 Field와 비슷한 느낌입니다.)



-----------------------------------------------------------------------------

# Checksum

[배움이 즐거운 개발자님 블로그 참고](https://galid1.tistory.com/310)

중복검사의 한 형태. 나열된 데이터를 더하여 checksum을 얻고,

정해진 비트수의 modular 연산을 해서 정해진 비트수로 재구성한다.



**목표는 무결성(Integrity)검사 -** 데이터가 제대로 왔는지 검사하는것

**방법**

1. 수신측에서 데이터를 16bit씩 나눔

2. Checksum부분은 나중에 수신자가 구한 checksum과 비교할 것 이기 때문에, checksum값을 제외하고 나머지를 모두 더해줌

3. Carry값이 발생하면 더해줌

4. 1의 보수를 취한다.

5. 이 값을 수신받은 Checksum과 비교   

   

-----------------------

# **CRC**(Cyclic Redundancy Check)

[도리의 디지털라이프님 블로그 참고](http://blog.skby.net/순환-중복-검사-crc-cyclic-redundancy-check/)

checksum과 같이 데이터의 오류를 검출하기 위한 기법. 한국말로 **순환 중복 검사**.

송신시 CRC값을 데이터에 붙여서 전송하고, 수신측은 수신된 CRC값과 비교   (Checksum과 매우 비슷하지만 Checksum과 다르게 데이터의 순서바뀜도 알 수 있다.)

![img](/images/About CRC/1.png){: width="466" height="233"){: .aligncenter}


**방법**

1. (Data + n) bit로 구성된 데이터를 (n+1) bit Divisor로 나누어 CRC를 생성

2. 데이터 뒤에 CRC를 붙여서 전송

3. 받은 데이터를 Divisor로 나누고, 나머지가 0이면 accept, 0이 아니면 reject

   

------------------

# **B-Tree**

[백인감자님 블로그 참고](https://potatoggg.tistory.com/174)

우선 Tree 구조란?

-> 그래프의 일종, 서로 다른 두 노드를 잇는 길이 하나뿐인 것!



**용어 먼저 정리**

\- Root node : Tree의 최상위 노드

\- Parent node : A가 B를 가리킬 때 A가 B의 parent node

\- Child node : B가 A의 child node

\- Leaf node : child node가 없은 node

\- Internal node : leaf node가 아닌 node



**B-Tree의 특성**

1. root node가 leaf node인 경우를 제외, 최소 2개의 child node를 가집니다.

2. root node와 leaf node 제외, 모든 node는 최소 [M/2], 최대 M개의 서브 트리를 가집니다.

  - []는 올림연산, M은 tree의 Degree or Order.

3. 모든 leaf node들은 같은 level에 있어야 합니다.

4. 새로운 key는 leaf node에 삽입.

5. node 내 key는 오름차순으로 정리.

6. leaf는 최소 [M/2]-1 개의 key를 가지고 있어야 합니다.



**B-Tree삽입과 삭제**

직접 위 블로그로 가서 B-Tree를 만들어보면 이해가 빨리 됩니다.  

<img src="/images/About B-tree/1-2.png" width="800px" height="300px" align="center">   
<img src="/images/About B-tree/3-4.png" width="800px" height="300px" align="center">   
<img src="/images/About B-tree/5-6.png" width="800px" height="300px" align="center"> 

  

# **Atomicity**

한국이름으로 "**원자성**"

어떤 것이 더 이상 쪼개질 수 없는 성질을 말하는데, 

**프로그래밍 분야**에서는

어떠한 작업이 실행될때 언제나 **완전하게 진행되어 종료**되거나, 그럴 수 없는 경우 **실행을 하지 않는 경우**를 말합니다. 원자성을 가지는 작업은 실행되어 진행되다가 종료하지 않고 **중간에서 멈추는 경우는 있을 수 없다**고 합니다. 뒤에서 이야기 할 Transaction이 가지고 있는 성질입니다.



------------------

# Transaction

[mommoo님 블로그 글 참고했습니다.](https://mommoo.tistory.com/62)

데이터베이스의 상태를 변환시키는 하나의 논리적 기능을 수행하기 위한 작업의 단위, 

또는 한꺼번에 모든 수행되어야 할 일련의 연산들을 의미합니다.



**데이터베이스의 상태를 변환시킨다?**

: SELECT, INSERT, DELETE, UPDATE 같은 질의어를 이용하여 데이터베이스에 접근하는 것.

 하나 Transaction에 질의어가 하나일수도 있고, 여러개일수도 있고? 하여튼 하나로 합쳐서 하나의

 작업 단위로 처리하는 것, 그리고 이러한 작업 단위를 하나의 Transaction



4가지 특징

* Atomicity
  * transaction이 DB에 모두 반영되던가, 전혀 안되던가

+ Consistency
  
+ transaction이 진행되는 동안에 DB가 변경되도, 처음 transaction을 하기 위해 참조한 DB에서!
  
+ Isolation
  
+ 둘 이상의 transaction 이 동시에 실행되고 있을 경우, 서로의 연산에 끼어들 수 없다.
  
+ Durability

  + transaction이 성공적으로 완료되었을 경우, 결과는 영구적으로 반영되어야 한다.

  

---

# Pipeline

   

Processor에서 성능을 높이기 위한 명령어 처리 과정

**point는 병렬화!**

실제로는 각각의 명령어 처리 단계에 걸리는 시간이 일정하지 않아서 시간 지연이 생기게 되는데,

이것을 **Hazard**라고 함



Hazard에는 세가지가 있다.

- Structural Hazard
- Data Hazard
- Control Hazard



[pwnWiz님 블로그 글 참고했습니다.](https://pwnwiz.tistory.com/7)

<img src="/images/About Pipeline/1-2.png" width="800px" height="300px" align="center"> 

<img src="/images/About Pipeline/3-4.png" width="800px" height="300px" align="center"> 

<img src="/images/About Pipeline/5.png" width="400px" height="300px" align="center"> 

   

---

# COW(Copy-On Write)

​      

한마디로 Resource를 **사용해야 할 때 그것만 Copy해준다.**

(OS에 관한 지식이 많지않아 자세한 내용은 다루지 못했습니다.)



[이즈리얼님 블로그 글 참고했습니다.](http://izreal.egloos.com/v/36669)

<img src="/images/About COW/1-2.png" width="800px" height="300px" align="center"> 



---

# Covariance

두개의 확률변수의 관계를 보여주는 값이다.

확률변수 x와 Y에 대해, x가 변할때 y가 변하는 정도를 나타내는 값