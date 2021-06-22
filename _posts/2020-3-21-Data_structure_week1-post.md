---
layout: post
author: Jungbeom
---


KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되어가고 있기 때문에 Python을 이용하여 강의를 진행한다.

---
-준비물-

오프라인 강의 오기전에 예습

2명이 팀이고 같이 진행

파이썬이 있는 노트북(python 3.5 and the most recent version of PyCharm

KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
KAIST 산업및시스템공학과 문일철 교수님의

데이터 구조 및 분석: Linear Structure and Dynamic Programming

edwith 강의를 보고 정리한 내용입니다.



---
# Orientation

건물들을 보면 보통 일정한 **패턴**를 가지고 있는데, 그렇지 않으면 뭔가 어색하다. 왜 일정한 패턴을 가지고 있냐고 물어본다면, 그렇게 만드는게 효율적이니까 그렇다.

Data structure도 마찬가지이다. 건설에 비유해보자. **Data Structure**가 방 배치를 어떻게 할것인가라면, **Algorithm**은 어떻게 그 방을 찾을까라고 할 수 있다.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**

Analyzed data = Accessed data

실제로 실무에 나가게 되면, Analyzed 된 데이터를 다루는게 아니라 직접 Analyze해야하기 때문에 Analyzing method는 매우 중요함 (할 줄 알아야 함)

파이썬은 Analizing의 key가 되
