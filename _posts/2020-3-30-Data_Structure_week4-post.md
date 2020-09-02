---
title:  "Data Structure week4"
excerpt: "문일철 교수님의 데이터 구조 및 분석 Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다."
date: 2020-3-30 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
lastmod : 2020-3-30 12:00:00
---



---

# Data Structure Week 4

KAIST 산업및시스템공학과 문일철 교수님의

[데이터 구조 및 분석: Linear Structure and Dynamic Programming](https://www.edwith.org/datastructure-2019s/joinLectures/21992)

[edwith](https://www.edwith.org/) 강의를 보고 정리한 내용입니다.



## Weekly Objectives

This week, we learn how to program recursive routines and dynamic programming concepts.

- **Recursion**
- **Dynamic programming**



Objectives are

- Understanding the **concept of recursions**
  - Repeating problems
  - Divide and conquer
  - Recursion function call
  - Recursion escape
  - Recursion depth
- Able to implement recursive programs
- Understanding **the concept of dynamic programming**
  - Reusing previous function call result (재활용으로 실행시간을 빠르게)
  - Memorization for time saving



---

## Repeating Problems and Divide and Conquer

​                                                                    회사체계 Diagram

<div class = "mermaid">
  graph TD
  A["회사"] --> |150| B["인사부"]
  A --> |300| C["영업부"]
  A --> |150| D["개발부"]
  C --> |100| E("서울점")
  C --> |100| F("인천점")
  C --> |100| H("부천점")
</div>

 ex) 내가 CEO이고, 각 부서에 필요한 돈을 내려주면,

자연스럽게 계층적인 구조가 된다. 돈의 분배가 반복적으로 일어난다. (Repeating Problems)

이때 돈의 양은 아래계층으로 내려가면서 줄어든다. (Divide)



**Repeating Problem**란?

: Problem이 반복해서 일어난다. (이름그대로)



**Divide and Conquer**란? 

: 문제를 **쪼개서** 문제를 해결해나가는 과정

---

```python
# Pseudo code
class Department:
    dept = ["sales", "manu", "randd"]
    def calculateBudget(self):
        sum = 0
        for itr in range(0, numDepartments):
            sum = sum + dept[itr].calculateBudget()
        return sum
```

calculateBudget function 안을 보면,

**동일한 calculateBudget function를 호출하고 있다.**

무작정 함수안에서 그 함수를 또 call하는 형태로 만들었다고 해서 Recursion이라고 하지않는다.

**포인트는 반복하는 과정에서 scale이 더 작아진 Parameter가 들어온다는 것이다.**

이것을 바로 **Recursion**이라고 하고, (Divide된 작은 문제로 동일한 함수를 call)

Recursion의 컨셉이 바로 **Divide and Conquer**이라고 한다.



---

### More examples

Repeating Problem의 예제를 더 알아보자.



---

#### Factorial

$$
Factorial(n) = \begin{cases}
1, & \mbox{if }n\mbox{ = 0} \\
n*(n-1)\ *...*\ 1, & \mbox{if }n\mbox{ > 0}
\end{cases}
$$



---

#### Great Common Divisor

최대공약수를 구하는 방법중 하나가 [Euclid's algorithm](#euclid's-algorithm)이 있음.

GCD(A, B) = GCD(B, A mod B)

GCD(A, 0) = A

예를 들어서

GCD(32, 24)

= GCD(24, 8)

= GCD(8, 0) = 8 이 바로 GCD!



```python
def Euclidean(a, b):
    r = a % b
    if r != 0:
        r = a % b
        return Euclidean(b, r)
    else:
        return b
```



---

### 공통점

- **Function call이 반복된다.**
- Parameter size는 **줄어든다.**
- [Mathematical induction](#mathematical-induction) (Reverse Mathmatical Indunction..?)과 유사하더라.



**Self-Similar** 한것이 반복적으로 일어난다.

**다만 Size는 줄어든 상태로!**



---

## Definition of Recursion

: A **programming method** to **handle** the **repeating items in a self-similar way**

Function call 속에서 또 function을 반복적으로 call하는 형식.

```python
# Pseudo code
def functionA(target):
    ---
    functionA(target prime) // target의 size가 줄어듬
    ---
    if (escapeCondition):
        return A;
```



[Fibonacci sequence](#fibonacci-sequence)(피보나치 수열)을 표현한 실제 코드를 보면,

위에서 말했던 것 처럼, Function안에서 Function call이 일어나고 있고,

Parameter size는 n에서 n-1, n-2로 줄어들었다.


$$
Fibonacci(n) = \begin{cases}0, & \mbox{if }n\mbox{ = 0} \\ 1, & \mbox{if }n\mbox{ = 1} \\ Fibonacci(n-1)\ +\ Fibonacci(n-2), & \mbox{if }n\mbox{ >= 2} \end{cases}
$$

```python
def Fibonacci(n):
    # escape routine
    if n == 0:
        return 0
    if n == 1:
        return 1
    
    # Recursion with smaller size parameter
    intRet = Fibonacci(n-1) + Fibonacci(n-2)
    return intRet

for itr in range(0, 10):
    print(Fibonacci(itr))
```





---

## Recursions and Stackframe

Recursion 할 때 컴퓨터 내부에서는 어떻게 처리하고 있을지 살펴보자.

**Recursion of function**은 컴퓨터 내부에서 Increase the items in the **Stackframe**

: Stackframe은 Function call의 **역사를 기록하고 있는 "Stack" (LIFO, Last In First Out)**

Stack의 Operation은 **Push, Pop** (Top에서만 이루어졌던거 기억하기!)

Stackframe 에서도 마찬가지로,

- Push : **When a function is invoked** (Function call이 일어나면 push)
- Pop : **When a function hits return or ends** (Function이 return되면 pop)



**What to store?**

Local variables 과 Function call parameters를 저장함

- Local variables : **Function속에서만** 접근이 가능한 변수.
- Function call parameters : 특정 Function call **instance**에 할당된 **Parameter**.
  - ex) F(4)에서 4가 Function call parameter!



흘러가는 모양을 **Stack으로 표현**을 해보면..

<img src="/images/About Stackframe/1.png" width="800px" height="400px" align="center">   

이런식으로 흘러가게 된다.

(그림을 mermaid로 이쁘게 넣고 싶었는데 사이즈 조절을 못하겠네요 ㅠㅠ)



---

## Merge Sort

: 다양한 Sorting 방법중에, **Recursion을 이용한 Sorting Algorithm이다.**



기본적인 원리는

LIst를 더 작은 사이즈로 **계속해서 쪼개고,** 

**더 쪼개질 수 없을 때 List안의 값을 비교하면서 순서에 맞게 다시 리스트를 합쳐나가는 것이다.**

- **Decompose** into two smaller lists
- **Aggregate** to one larger and sorted list

긴 리스트를 Decompose 해가면서 쪼갠다.

Aggregate는 두개의 리스트를 합쳐나가는데,  **작은 것을 앞에쓰고, 큰것을 뒤에 쓰면서 sorting함**

(행렬곱의 순서와 똑같이 비교한다.)



결국 **MergeSort**는 **재귀적**으로 하위의 더 작아진 List에서 

**연속적으로 Function call**이 이루어져서 나온 return들을 합친것을 최종 return으로 받게 됨



---

### Implementation Example: Merge Sort

```python
import random

def performMergeSort(lstElementToSort):
    # Escape routine
    if len(lstElementToSort) == 1:
        return lstElementToSort
    
    # Decomposition
    lstSubElementToSort1 = []
    lstSubElementToSort2 = []
    for itr in range(len(lstElementToSort)):
        if len(lstElementToSort)/2 > itr:
            lstSubElementToSort1.append(lstElementToSort[itr])
        else:
            lstSubElementToSort2.append(lstElementToSort[itr])
    
    # Recursion, 여기서 List가 전부 쪼개진 형태가 됨
    lstSubElementToSort1 = performMergeSort(lstSubElementToSort1)
    lstSubElementToSort2 = performMergeSort(lstSubElementToSort2)
    
    idxCount1 = 0
    idxCount2 = 0
    for itr in range(len(lstElementToSort)):
        # 한쪽에 있는 element가 다 lstElementToSort로 들어갔을때를 대비
        if idxCount1 == len(lstSubElementToSort1):
            lstElementToSort[itr] = lstSubElementToSort2[idxCount2]
            idxCount2 += 1
        elif idxCount2 == len(lstSubElementToSort2):
            lstElementToSort[itr] = lstSubElementToSort1[idxCount1]
            idxCount1 += 1
        # 본격 값 비교 if statement
        elif lstSubElementToSort1[idxCount1] > lstSubElementToSort2[idxCount2]:
            lstElementToSort[itr] = lstSubElementToSort2[idxCount2]
            idxCount2 += 1
        else:
            lstElementToSort[itr] = lstSubElementToSort1[idxCount1]
            idxCount1 += 1
    return lstElementToSort
    
lstRandom = []
for itr in range(0, 10):
    lstRandom.append(random.randrange(0,100))
print(lstRandom)
lstSorted = performMergeSort(lstRandom)
print(lstSorted)
```

이렇게 작성하면 된다.



뒤에서 하게 될 **Dynamic Programming** 방식으로도  Merge Sort를 짤 수 있을까 싶어서 찾아봤는데,

Merge Sort를 Dynamic Programming방식으로 짜는건 알맞지 않다.

**그 이유는 Merge Sort에는 Overlapping되는 sub-instance가 없기 떄문이다!** 

-> **이전에 이미 계산했던 instance와 같은 값을 가진 instance를 Re-use할 일이 없다는 뜻!**

​    (물론 Merge sort할 List안에 중복되는 값이 있을 수는 있지만, 그 값을 재사용 할 일은 없다.)

자세한 설명은 [이곳을 확인 (영어주의)](https://stackoverflow.com/questions/15596363/why-mergesort-is-not-dynamic-programming)



---

## Problems in Recursions of Fibonacci Sequence

Recursion의 문제점은 **Function call**이 너무 많다는것

심지어 동일한 Parameter를 가지고있는 function call이라서,

**같은 값을 가지는 녀석들을 불필요하게 반복하게 됨**



**Dynamic Programming**은 이러한 문제점을 해결할 수 있는 방법이다. 

-> Unnecessary한 function call을 줄일 수 있다.

어떻게?

: 결과값을 **기록**해두면 된다.



---

## Dynamic Programming

: A **general algorithm design technique** for solving problems defined by or formulated as **recurrences with overlapping sub-instances** (overlapping sub-instance가 있는 형태의 recurrence을 푸는 방식)

overlapping sub-instance (중복된 값이 여러번 나오는 걸 의미한다.)

-> 중복되는 하위 값들



Main storyline (recurrence structure를 거꾸로 만드는 스토리라인)

- Setting up a recurrence
- Small Instance를 Solve한다.
- Local variable로 받아서 그때그때 쓰는게 아니라, **Instance의 return에 대한 값을 table에 record한다.**
- **Extract a solution of a larger instance from the table**

-> F(4) 를 풀기위해 F(1), F(2), F(3)을 먼저 계산해서 기록해두는것



### Memoization (Memorization 아님)

Dynamic Programming의 **핵심**은 무엇일까? (Recursion과의 차이점은?)

- **Storing** the result of previous function calls (다시 사용하기 위해서)

**이전 결과를 저장하는 공간을 Memoization이라고 한다.**



Memoization와 이전에 나왔던 Stackframe에는 **철학적인 차이**가 있음

- More philosophical sense
  - **Recursion : Top-down** of divide and conquer (위에서 아래로 나누어서 계산하고)
    - 풀려고하는 것을 먼저시도를 하다가 어쩔수없이 recursion 느낌?
    - stackframe을 이용한 top-down 방식
  - **Dynamic programming** : **Bottom-up** of storing and building (아래서부터 계산하여 올라가는 방식)
    - memoization table을 이용한 bottom-up 방식

**sub-instance가 많다고 할 경우 Dynamic programming을 이용해서 푸는게 좋음**



---

## Implementation Example: Fibonacci Sequence in DP

Recursion과 다르게 Function속에 다시 같은 Function call하는 코드는 필요 없다.

대신, **결과를 쌓을(저장할) Table(memoization)은 있어야함**

```python
def FibonacciDP(n):
    dicFibonacci = {}
    dicFibonacci[0] = 0
    dicFibonacci[1] = 1
    for itr in range(2, n+1):
        dicFibonacci[itr] = dicFibonacci[itr-1] + dicFibonacci[itr-2]
    return dicFibonacci[n]

for itr in range(0, 10):
    print(FibonacciDP(itr))
```

(Memoization을 만들때는 Dictionary collection variable type을 쓰는게 좋다.)

- Storing a Fibonacci number for a particular index



시간복잡도(7주차에 배울 예정)을 비교해보면

- We have a new space requirement, the dictionary or the table, of O(N) 

  (나중에 배울거임, 최대얼마만큼 커질수 있느냐? 라는 한계를 나타내는 Big-O notation이라는거)

- We have reduced execution time from O(2^n) to O(N)



Recursion을 활용했을때 시간복잡도가 O(2^n)이었던것이,

Dynamic Programming일때  O(N)으로 줄어듬



---

### Assembly Line Scheduling

Dynamic Programming의 예시

ex) 자동차 공장

- 여러가지 공정을 Station단위로 나눴다. 
- **Station들로 구성된 Line들**이 여러개이다.
- 각각의 **Station마다 소요시간이 다르다**.
- **기계가 고장나는것을 대비하여 옆라인으로 이동할 수도 있다고 한다.**(이동하는것은 추가시간이 필요하다.)

어느 Line으로 넣어주어야 **생산품이 더 빨리 나올것이냐**에 대해서 생각해보아야함

어떤 방법이 생산품이 더 빠르게 나올지를 알기위해

Dynamic Programming을 사용한다.

Key point는 **Bottom-up** 이라는것  (Stackframe은 Top-down)



### Process of Assembly Line Scheduling

Table에 이전의 결과를 **기록**함으로써, 

적은수의 Function call으로도 **Problem의 boundary를  확장해나갈수있다.** (**문제를 growth**)

Assembly Line Scheduling 예시에서는 Memoization table 두개를 사용

- **Minimum Travel Time** (어떤 Station에 도착하는 **최단시간**을 기록한다.)
  
  - 앞에서 기록해둔 Time들로 뒤에 것들을 쉽게 계산해낼수 있는것
- **Retrace Table** (바로 직전 어떤경로를 통해서 여기까지 오게되었는지 기록한다.)
  
  - 어디서 받는것이 최고로 좋은지 적어놓는 Table
  
    **Retrace Table을 이용해서 역추적하여 최적의 경로를 알 수 있음.**



---

## Implementation Example: Assembly Line Scheduling in Recursion

먼저 Assembly Line Scheduling을 Recursion을 이용해서 짠다.

Recursion을 code로 짤때 가장먼저 생각할거 : **Escape routine**

**Recursion 방식**으로 짠 Assembly Line Scheduling code

(교수님이 반드시 직접 타이핑해서 짜보라고 하셨음.) 

```python
# Top-down
class AssemblyLines:
    timeStation = [[7,9,3,4,8,4], [8,5,6,4,5,7]]
    timeBelt = [[2,2,3,1,3,4,3], [4,2,1,2,2,1,2]]
    intCount = 0
    def Scheduling(self, idxLine, idxStation):
        '''
        idxLine : This indicates which Line is it.
        idxStation : This indicates the number of stations.
        '''
        print("Line, Station :", idxLine, idxStation, "recursion calls :", self.intCount)
        self.intCount = self.intCount + 1
        
        # Escape routine
        if idxStation == 0:
            if idxLine == 1:
                return self.timeBelt[0][0] + self.timeStation[0][0]
            elif idxLine == 2:
                return self.timeBelt[1][0] + self.timeStation[1][0]
        
        # Recursive call
        '''
        costLine1 : When it doesn't go across Lines.
        costLine2 : When it goes across Lines. 
        '''
        if idxLine == 1:
            costLine1 = 
            	self.Scheduling(1, idxStation-1) + self.timeStation[0][idxStation]
            costLine2 = 
            	self.Scheduling(1, idxStation-1) + self.timeStation[0][idxStation] + self.timeBelt[1][idxStation]
        elif idxLine == 2:
            costLine1 = 
            	self.Scheduling(2, idxStation-1) + self.timeStation[1][idxStation]
            costLine2 = 
            	self.Scheduling(2, idxStation-1) + self.timeStation[1][idxStation] + self.timeBelt[0][idxStation]
        
        # Compare which one takes less time.
        if costLine1 > costLine2 :
            return costLine2
        else:
            return costLine1
        
    def startScheduling(self):
        numStation = len(self.timeStation[0])
        costLine1 = self.Scheduling(1, numStation - 1) + self.timeBelt[0][numStation]
        costLine2 = self.Scheduling(2, numStation - 1) + self.timeBelt[1][numStation]
        if costLine1 > costLine2 :
            return costLine2
        else:
            return costLine1   
```





---

## Implementation Example: Assembly Line Scheduling in DP

이번에는 Dynamic Programming 방식으로 짠 Assembly Line Scheduling code이다.

언뜻 보면 Recursion보다 더 복잡해보이지만, 프로그램을 실행하는 입장에서는 더 간단함.

(Recursion으로 짜면 보는 입장에서 직관적으로 볼 수 있다는 장점이 있다.)

```python
# 프로그램을 실행하는 입장에서 더 간단함
# Bottom-up
class AssemblyLines:
    '''
    timeScheduling : Travel time table
    stationTracing : Retrace table
    '''
    timeStation = [[7,9,3,4,8,4], [8,5,6,4,5,7]]
    timeBelt = [[2,2,3,1,3,4,3], [4,2,1,2,2,1,2]]
    # Assign memoization tables
    timeScheduling = [list(range(6)), list(range(6))]
    stationTracing = [list(range(6)), list(range(6))]
    def startSchedulingDP(self):
        numStation = len(self.timeStation[0])
        # Memoization tables의 초기값 설정
        self.timeScheduling[0][0] = self.timeStation[0][0] + self.timeBelt[0][0]
        self.timeScheduling[1][0] = self.timeStation[1][0] + self.timeBelt[1][0]
        
        for itr in range(1,numStation):
            '''
            어떤 Station에서 그 다음 Station으로 갈 때,
            다른 Line에서 오는게 빠른지,
            아니면 기존 Line에서 오는게 빠른지 비교 후, 더 빠른쪽을 더해줌.
            '''  
            if self.timeScheduling[0][itr-1] > self.timeScheduling[1][itr-1] + self.timeBelt[1][itr-1]:
                self.timeScheduling[0][itr] = 
                	self.timeStation[1][itr] + self.timeBelt[1][itr] + self.timeScheduling[1][itr-1]
                self.stationTracing[0][itr] = 1
            else :
                self.timeScheduling[0][itr] = 
                	self.timeStation[0][itr] + self.timeScheduling[0][itr-1]
                self.stationTracing[0][itr] = 0
                
            if self.timeScheduling[1][itr-1] > self.timeScheduling[0][itr-1] + self.timeBelt[0][itr-1]:
                self.timeScheduling[1][itr] = 
                	self.timeStation[1][itr] + self.timeBelt[0][itr] + self.timeScheduling[0][itr-1]
                self.stationTracing[1][itr] = 0
            else :
                self.timeScheduling[0][itr] = 
                	self.timeStation[1][itr] + self.timeScheduling[1][itr-1]
                self.stationTracing[1][itr] = 1
        
        costLine1 = self.timeScheduling[0][numStation-1] + self.timeBelt[0][numStation]
        costLine2 = self.timeScheduling[1][numStation-1] + self.timeBelt[1][numStation]
        
        # 마지막 Retracing table element 출력을 위한 조건문
        if costLine1 > costLine2 :
            return costLine2, 1
        else:
            return costLine1, 0
        
    def printTracing(self, lineTracing):
        numStation = len(self.timeStation[0])
        print("Line :", lineTracing, "Station :", numStation)
        for itr in range(numStation-1, 0, -1):
            lineTracing = self.stationTracing[lineTracing][itr]
            print("Line :", lineTracing, "Station :", itr)
```



---

## Details

### Euclid's algorithm

![img](/images/About Euclid's algorithm/1.png){: width="400" height="300"){: .aligncenter}



---


### Mathematical induction

 [jjycjn's Math Storehouse 블로그 참고](https://jjycjnmath.tistory.com/99 )

1. P(2)가 참이다. 

2. P(n)이 참이면 P(2n)도 참이다. 

3. P(n)이 참이면 P(n−1)도 참이다. 



---

### Fibonacci Sequence

 [SUNGHWAN PARK님 블로그 참고](https://shoark7.github.io/programming/algorithm/피보나치-알고리즘을-해결하는-5가지-방법) 

피보나치 수열의 0번째 항은 0, 1번째 항은 1, 그 외 항은 Fibo(n-1)과 Fibo(n-2)의 합으로 표현된다. 피보나치 수열을 구하는 데에는 다양한 알고리즘이 있다.

1. 위에서 했던 재귀적 풀이
2. Loop문을 이용한 반복적 풀이
3. Dynamic 계획법을 이용한 풀이




