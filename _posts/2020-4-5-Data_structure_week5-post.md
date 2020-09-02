---
title:  "Data Structure week5"
excerpt: "문일철 교수님의 데이터 구조 및 분석: Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다."
date: 2020-4-5 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
lastmod : 2020-4-5 12:00:00
sitemap :
changefreq : daily
priority : 1.0
---



---

# Data Structure Week 5

KAIST 산업및시스템공학과 문일철 교수님의

[데이터 구조 및 분석: Linear Structure and Dynamic Programming](https://www.edwith.org/datastructure-2019s/joinLectures/21992)

[edwith](https://www.edwith.org/) 강의를 보고 정리한 내용입니다.



---

## Weekly Objectives

- This week, we briefly learn the concept and the application of conputer simulations
  - Introduction purpose



Objectives are

- Understanding the concepts of modeling and simulation.



Application 중 하나인 Simulation의 종류와 정의에 대해 알려주십니다.

크게 3가지 종류의 Simulation에 대해 언급하시는데, 저같은 경우는 헷갈리는게 많았습니다. 

이번 강의들은 이런게 있다고 생각하면서 들으시고 넘어가면 좋을 것 같습니다. 



---

## Real World Problems

Real world problem을 해결하기 위해서 과학적이고, 공학적으로 해결하는 구체적인 **Solution도 찾아야하고,**

Computational analyses를 이용해서 관리하는 **Solution을 만들어 내는것도 해야함**

-> **Simulation을 만들어야 한다!**



하지만 이런 Solution을 잘 만들기 위해선, **먼저 Problem에 대해 이해해야 한다!**

(이해가 바탕이 되지않으면 엉뚱한 Solution을 내놓을수도 있기 때문)



---

## How to comprehend a problem?

먼저 Program에서 이해한다는게 무엇인지 생각해보자.

**Program을 어떻게 이해할 수 있을까?**

- 주어진  Input에 대해서 **Output이 무엇일지 예상한다.**

  Output를 예상할 수 있다는 말은 **"프로그램이 어떻게 구동되고 있는지 이해하고 있다" 라는 말과 같다.**

- **Estimate the progress of the program in the system** (어떻게 돌아가고 있는지 추정한다.)

- Just as we **traced** the function calls of the recursion in **the** **execution timeline** 

  (Recursion에서 그랬던것 처럼 프로그램의 실행을 역추적해서 살펴본다.)



**문제 해결 과정**

1. Fibonacci Sequence라는 문제가 있다.

2. Program으로 표현든다. (Modeling)

3. Program을 Execution하고 Trace해서 어떻게 돌아가는지 알아낸다.

예측 -> 표현(프로그램으로) -> **Execution**



**How to comprehend a problem in real world?**

**현실 세계의 문제는 어떻게 이해해야할까?**

ex)  Markets/Finance

- Estimate the future of a given status-quo
- Estimate the progress of problem factors in the system
- **However, the real-world problem is not a program in a well-defined programming language**



**문제 해결 과정**

1. "가격예측과 형성"이라는 현실문제가 있다.

2. Supply and Demand curve로 만들었다 (Modeling) 

3. Supply and Demand curve의 **해를 구한다.**

예측 -> 표현(Supply and Demand curve) -> Solve(Execution) 



보기에는 현실문제를 다루는게 어려워보이지 않지만, 

**Fibonacci sequence는 수학적으로 아주 잘 정의되어 있지만,**

**현실의 문제는 그렇지 않기 때문에, 표현하는것 자체부터가 어렵다!**



---

## Models and Why Modeling

표현하기 어려운 현실모델을 **간략화**(Simplification)하여 **Model**을 만든다.

(단순화하지만, 핵심적인 특성은 다 있도록 만드는게 목적)



**Model**

:  **A simplification of the real world problems.**



ex) 몽타주는 왜 쓸까? 사진이랑 다를수도 있는데?

사진과는 다르지만, **얼굴의 특징을 잘 따서 만들었기 때문에 가치가 있음**



ex) **Antoine de Saint-Exupery said** 

> **"Perfection is achieved, not when there is nothing more to add,**
>
>  **but when there is nothing left to take away"**

(교수님께서 이 말은 공학자들이 Modeling에 대해서 듣고 기억할만한 말이라고 하심.)

**핵심만 표현하여서 더이상 뺄게 없는것이 완벽한 것 이다.**

공학자들이 **Modeling**이라는것을 할 때 **현실문제를 왜 simplification을 해야되고**, 

**무엇이 simplification의 대상이 되어야하는지**에 대한 문구로 볼 수도 있겠다.



**무엇을 빼야할까?**

: 분석의 목적에 따라서 달라진다.

- What to leave in the model
- What to remove from the real world



---

## Two Types of Models

### **Models to solve**

- **Numerical modeling**
  - Linear programming, integer programming
  - **목표는 현실의 문제를 formula로 표현해내는 것.**

> **최종적으로, 어떤 시점에서 해를 구해내는 것이 목표.**



하지만, **Real World를 항상 이런식으로 formula로 만들거나 할 수 있는건 아님.**

너무 복잡해서 **수학적인 해를 찾기 어려운 모델**도 존재

ex) Manufacturing Domain에서 반도체 생산

단순화해보면

- 프로세서
- 카트리지
- 자원의 배분 ..

**이런것들 하나하나를 수학적으로 표현하는건 어렵다.**

이것들의 행동을 하나하나 표현을 하는건 너무 복잡하니까,

그래서 이런 문제들을 Simulate함으로써 **최적의 운영방법을 찾는 방법**을 **Simulation**이라고 한다.



---

### **Models to simulate**

- **System dynamics, Discrete event models, Agent based models**

  - Event graphs, petri-net, agent modeling

    Numerical modeling처럼 **딱 떨어지는 해가 나오지않음**

    ==대신 **예측치**를 만들어냄==

> **"다양한 세팅에 대해서 아주 여러번 Simulation을 하면 최적의 Solution를 찾을 수 있을까"라고** 
>
> **하는 Model이 바로  Simulation Model**

이렇게 구해낸 해가 최적이다라고 장담은 못함



---

####  **System Dynamics**

[혀노님 블로그 참고](https://m.blog.naver.com/PostView.nhn?blogId=eugene4213&logNo=221082416976&categoryNo=62&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

일반적으로 **장기적인, 전략적 모델에서 사용**됨

사람들, 제품, 이벤트, 그리고 그 밖의 다른 개별적인 품목들을 **그들의 수량**으로 나타냅니다.

**비선형 모델, 순환적 연동에 근간**(the many circular, interlocking..)



---

##### Infectious Disease

**SIR Model (1925)**

- S : Susceptible (병에 걸릴 수 있는 상태)
- I : Infectious (병에 걸린 상태)
- R : Recovery (병에서 회복한 상태)

: 인구상태를 세개의 상태로 표현한 Model

**수가 변화되어가는 과정을 컴퓨터 Simulation함** (구체적인 해는 굳이 구해내지 않음)


$$
\frac{dS}{dt}=\ -βIS ,   
\frac{dI}{dt}=\ βIS -vI, 
\frac{dR}{dt}=\ vI \\\
$$


**첫번째 식**

- 시간에 차이에 따른 S의 차이는, I와 S를 곱한 것 이다.
- S와 I의 관계를 잘 생각해보기

**두번째 식**

- 시간의 차이에 따른 I는, I와 S를 곱한것이지만, 회복한 사람만큼 줄어든다.

**세번째 식**

- 시간의 차이에 따른 R은, v와 I를 곱한 것 이다.
- 상태였던 사람은 시간에 따라서 R상태로 간다.



> **수식으로 표현된 상태에 따른 인구수의 변화를 컴퓨터 Simulation으로 만든거**

어떤 시간대를 주고 그때의 상황을 **계산할수도 있긴 하지만**(해를 구할 수도 있지만),

대신에 **Computer Simulation을 이용해서 Approximation(근사)함.**



현실문제를 공식에 따라서 **표현**한 것을 프로그램으로 만든 후에,

**execution을 통해 미래를 예측하는것을 Simulation!**

특히 위와같은 기법은 **System Dynamics**라고 함

-> 미분방정식 기반(?)의 Simulation을 활용한 현실문제 추정과 표현 기법



---

#### Discrete Event Simulation

[혀노님 블로그 참고](https://m.blog.naver.com/PostView.nhn?blogId=eugene4213&logNo=221082416976&categoryNo=62&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

==연속 사건 사이에서 **System의 변경은 발생하지 않는다고 가정**합니다. ==

따라서 Simulation은 한 Event에서 다음 사건으로 제 시간에 **직접 점프** 할 수 있습니다.

이는 Simulation이 시간이 지남에 따라 **System Dynamics를 지속적으로 추적하는** 

**연속 시뮬레이션(Continuous Simulation)과는 대조적**입니다. 

(여기서 말하는 연속시뮬레이션은 실수단위의 데이터에 기반하여 모델링 되는 시스템)

- **미분방정식**을 통해 **시간의 변화에 따른 연속적인 변화**를 나타내는 Simulation기법

  (뭔가 아까 앞에서 나왔던 System Dynamics와 비슷해보입니다.)



**Discrete Event Simulation**은 **고정된 환경**하에서

**일률적이며 연속적으로 발생하는 사건들은 시스템의 직,간접적인 변화를 일으키지 않는다고 가정**한 모델

- 사실 현실에서 일어나는 거의 모든 일이 확률적이고 랜덤하다. 

  그 와중에 확정적으로 일어나는 일 또한 분명있다.

> **결국 Discrete Event simulation에서 연속적으로 일어나는 Event는 시스템에 큰 영향을 끼칠만한 것이 아니라는 전제를 깔고간다.**



---

##### Hospital Management

ex) 병원에서 사람들은

- 대기실
- Exam room
- 치료실
- 출구

이런곳을 돌아다닌다.



SIR Model과 다른점은, **여기에는 여러 Object들이 있음**

- 의사
- 환자
- 간호사
- ...

이 Object들과 Resource들이 서로서로  **Interaction**을 일으킨다.



그리고 예를들어 환자라는 Object는 환자진료 프로세스에 따라서 움직인다.

There are **a sequence of the patient care process.**

환자가 병원에 옴 -> 예약 -> 진료 -> Exit

(**Chaining 되어있는 작업들**)



이런 **Procedure**와 병원의 **Layout**(Procedure가 일어나는 공간)이 합쳐져서,

 **Simulation**이 된다. (7:35)

여기서 **Object**들이 각각의 **Procedure**를 만나는것을 **Event가 발생했다고 하고,**

앞의 SIR과 다른점은 **Event가 나눠져있다는 것이다.** 

(**SIR은 시간의 변화에 따라 지속적으로 변하는 것이었음. Event 단위가 아님**)



---

##### Airport Model

두번째 Discrete event simulation 예시

공항에서는

- 체크인
- 보안검사
- 식당
- Gates
- Plane 등등

같은 Event들이 있다.



이런 **Event들을 정의**하고, **통계를 많이 확보**하면 공항이라는 공간을 어떻게

보다 효과적으로 관리를 할 수 있을지 알 수 있다.(Simulation을 통해서)



Layout도 중요하지만, 

**Event들의 Sequence를 어떻게 설계하느냐가 성능을 좌지우지한다.** 



공항이 생긴다면 많은 사람이 방문하기 때문에 **최적화**(Optimization)시키는것이 중요하다.

**Simulation**을 만들어서 실험하는 것은 필수적이다. (한번 만들려면 돈이 엄청드니까 잘만들어야함)



---

#### Agent Based Simulation

[혀노님 블로그 참고](https://m.blog.naver.com/PostView.nhn?blogId=eugene4213&logNo=221082416976&categoryNo=62&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

핵심단어는 Decentralized(분산적), **Individual-centric**(개인중심)

The **active entities**(Object or Agent)를 **식별**하고,

 **행동을 정의**하고, 

그것들을 **특정환경에 배치**하고 **연결**하여 시뮬레이션을 실행



Discrete Event Simulation은 한계가 있음

- 같은 종류의 Object라도 **하는일들도 다르다**
- **목적**도 다를 수있음 (특성이 다르다)

단순히 움직이는 것이 아니라, **인구학적인 특성**을 가지고, **여러 변수들을 생각**해서

**개체(Entities or Object) 하나하나에 특징을 살리는 방식이 Agent Based Simulation**



---

##### Traffic Simulation

또다른 형태의 Simulation인 Traffic Simulation

- 자동차들마다 목적지도 다름
- 수송용 트럭일수도 있고, 관광용 버스일수도 있다.

**Graphic structure를 활용할 것임 (나중에 배움)**








