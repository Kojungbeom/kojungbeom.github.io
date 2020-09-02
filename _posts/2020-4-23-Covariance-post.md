---
title:  "Covariance (공분산)"
excerpt: "공분산이란?"
date: 2020-4-23 12:00:00
categories:
  - Information
tags:
  - Information
lastmod : 2020-4-23 12:00:00
---



# Covariance (공분산)

$$
 Cov(x,y) = E\{(X-m_x)(Y-m_y)\} = E(XY) -m_xm_y 
$$

The *Covariance* is a measure of how much the values of each of two **correlated** random variables determines the other. 

**Covariance는 두 확률변수의 관계를 나타내는것이다.**

- 독립적인 관계
- 양의 선형관계
- 음의 선형관계



먼저 $ E(X-m_x) $에 대해 생각해보자. (X에 대해서만 1차원적으로 생각해보자.)

<img src="/images/About Covariance/1.png" width="800px" height="200px" align="center"> 

이렇게 X축 위에 3개의 숫자가 있다. 각각 A=1, B=2, C=3이다.

이때 X = [A,B,C]라고 했을때 X의 Expected Value, 즉 기대값은 E(X) = 2이다.



<img src="/images/About Covariance/2.png" width="800px" height="200px" align="center"> 

그렇다면 $ X - m_x = [A-2, B-2, C-2]$가 된다. 

X라는 확률변수의 축이 2만큼 이동한 형태로 바뀐다.



Covariance라는건 위에서 말했던 것 처럼 두 확률변수의 관계를 나타내는 것이다.

2개의 확률변수 X, Y는 다음과 같다.

X = [0, 0.5, 1, 1.5, 2]

Y = [0, 0.5, 1, 1.5, 2]

두가지 확률변수 값들을 2차원 좌표평면에 나타내보면

<img src="/images/About Covariance/3-4.png" width="800px" height="400px" align="center"> 

위의 왼쪽 그래프와 같은 산점도가 그려진다. 

여기서 X와 Y의 평균(기대값)을 축으로 표현하면 오른쪽 그래프와 같다.

Covariance 수식으로 돌아와서 살펴보면

- $ Cov(x,y) = E\\{(X-m_x)(Y-m_y)\\} $

- $X-m_x = [-1,\ -0.5,\ 0,\ 0.5,\ 1]$

- $Y-m_y = [-1,\ -0.5,\ 0,\ 0.5,\ 1]$

위의 값을 이용해서 $(X-m_x) * (Y-m_y)$를 구하면,

$(X-m_x) * (Y-m_y) = [1,\ 0.25,\ 0,\ 2.5,\ 1]$가 된다. 

결국 $X-m_x, \ Y-m_y$의 **평균은 0이지만,** $ E\{(X-m_x)(Y-m_y)\} $는 **양의 값을 가지게 된다.**



이때**, 양의 값을 가지는 Covariance**를 근거로 두 확률변수가 

**양의 선형관계를 가지고있다**고 말할 수 있는 것이다. (점들이 주로 제 1,3사분면에 분포)



**반대로** X와 Y의 산점도가 위와 다르게 점들이 제 2,4사분면에 주로 분포를 한다면,

**두 확률변수가 음의 선형관계를 가지고있는 것이고 Covariance는 음의 값을 가진다.**



 **Covariance의 값이 0일 경우 두 확률변수는 독립적인 관계에 있는 것이다.** 

(선형관계일때만 해당한다. [Covariance의 약점](#covariance의-약점)에서 다룬다.)



위의 내용을 정리하면,

- **Covariance > 0**
  - 두 확률변수는 양의 선형관계
- **Covariance < 0**
  - 두 확률변수는 음의 선형관계
- **Covariance = 0**
  - 두 확률변수는 독립적인 관계



## Covariance의 약점

하지만 Covariance에는 약점이 있다!

1. **Covariance는 선형적인 관계만 파악할 수 있다.**
2. **확률변수들의 단위의 크기에 영향을 받는다.**

---

### 첫번째 약점

<img src="/images/About Covariance/5-6.png" width="800px" height="400px" align="center"> 

예를들어, 위 그래프와 같이 2차함수의 모양으로 분포되어 있다고 할 때,

이런식으로 표현이 되는데, X와 Y는 2차함수의 관계를 가지지만,

Covariance를 계산하면 0에 가깝게 나오기 때문에 

실제로 그렇진 않지만 해석상으로 두 변수는 독립적인 관계를 가진것이 된다. 

이처럼 선형관계 말고는 파악할 수 없다는 약점이 있다.



### 두번째 약점

Covariance는 단위의 크기에 영향을 받는다.

예를들어 시험점수와 공부시간의 관계를 Covariance로 나타낸다고 할때,

- 10점이 만점인 국어시험
- 100점이 만점인 영어시험

각각의 시험과 공부시간의 관계는 실질적으로 비슷하다고 하더라도

영어시험과 공부시간의 관계를 나타내는 Covariance가 더 큰 값을 가지게 된다.



이러한 결과를 방지하기 위해 Correlation(상관계수)를 사용한다.


$$
\rho = {Cov(X,Y)\over \sqrt{Var(X)Var(Y)}}
$$
​        

Correlation은 $\rho$라는 기호를 사용해서 표현한다.

이렇게 Covariance에 두 변수의 표준편차를 나눠줌으로써 

Correlation는 $-1\le \rho \le 1 $의 범위를 가진다.

이렇게 함으로써 단위의 크기에 의한 오류을 없앨 수 있다.

