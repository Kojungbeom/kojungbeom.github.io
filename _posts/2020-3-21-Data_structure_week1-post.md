---
title:  "Data Structure week1"
excerpt: 문일철 교수님의 데이터 구조 및 분석 Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다.
date: 2020-03-21 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
lastmod : 2020-09-02 12:00:00
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





**파이썬에 대해서 먼저 알아보기**

---
# Python review

This week, we review Python that will be used for a programming language for this course.

Objectives are

- 파이썬 환경 세팅
- HelloWorld program 실행하기
- 파이썬의 기본적인 문법 암기하기
- 파이썬의 프로그래밍 구조에 대해 이해하기
- 파이썬 변수들의 reference를 이해하기
- Control과 loop 구문 이해하기
- 함수 호출과 클래스 선언 이해하기
- 파이썬의 list, tuple, dictionary 이해하기
- Sample GUI program 실행하기



---
## Programming and DS&A(Data Structure and Algorithm)

> **Algorithm**
>
> An algorithm is a step-by-step procedure, which defines a set of instructions to be executed in a certain order to get the desired output. 

> **Data structure**
>
> A data structure is a data organization, management, storage format that enables efficient access and modification



두가지는 **연관성**이 있지만 **다른 계층**의 일을 한다.



**프로그래밍에서 Data structure와 Algorithm이 어떤 의미를 가지느냐!**

기본적으로 프로그래밍은 **구현하는 도구**!

- 예를들어, 건축가가 집을 지으려함 설계도를 들고있다. 

  집을 어떻게 이용하면 좋을지에 대한 아이디어가 담긴게 바로 설계도(구조, 동작들을 감안한 것). 

  그 다음 시공을 하는데 집을 지을 수 있는 도구가 필요함.(중장비)

-> 이때 설계도는 프로그래밍에서는 DS&A인거고, 도구는 Python



개발자는 **설계**도 필요하고 **구현**도 해야한다. 이때, **구현은 Programming으로 하고, 설계는 Data structure와 Algorithm으로, Python을 이용해서**

한다고 생각하면 되는데, 화장실을 짓는다고 했을 때, 화장실을 **어디에** 둘 것인지(Data structure), 어떻게 **찾을 지**(Algorithm)라고도 볼 수 있다.

나를 더욱 더 특별하게 만드는 건 단순히 프로그래밍만 잘하는게 아니라, 엔지니어로서 어떻게 **설계**를 할 것이냐이다.

> 프로그래밍과 Data Structure, Algorithm의 **조화**가 필요함



---

# What is Python

- 91년도에 발표

- **Interpreter language <-> Compiler**

  - Compiler는 실행이전에 최적화 시켜서 실행,
  - Interpreter는 최적화되지 않아도 그때그때 실행.

  -> 코드 작성은 빠르고 실행은 느리다. Fast development speed, slow execution speed

- **Object-oriented Programming**
- **Dynamic type of variables**

- **Unique code structure**
  
- 좋은 Structure를 유지하도록 강제한다는 관점에서 Structure에 적응하면 자유로운 것보다 편할수 도 있음.
  
- **Specialty in data analyses**
  - Various numerical and statistical libraries : **Numpy** and **Scipy**
  - Base language for Tensorflow and others



---
## Programming and Execution Environment

Integrative Development Environment(IDE)

- 파이썬 위에 있어서 걔를 활용하는거 Text edit나 특정 행동을 다하고 파이썬에서 돌리기 위한 도구.
- To reduce implementation time, debugging time

자세히 들어가기 전 간단히 파이썬에서 구성요소를 나열하면

- **indentation** -> 파이썬은 들여쓰기(indentation)로 block 지정한다.

- **self**는 자기 자신을 의미한다. self라는 변수를 이용해서 행동을 정의하게끔 하는 것 이다.

- Constructor, Destructor는 Instance가 생성 또는 없어질 때 실행

- class는 **틀, 판**(Templete)과 같다.



---
## **Naming and Styling**



회사마다, 연구실마다 다 다르긴 한다. 의미를 잘 전달할 수 있는 형식으로 만들어야 한다는 건 똑같다.

**Camel Casing 방식**

ex) HelloWorld

Naming : Use names clearly conveying the meaning

- class name : Noun for the concept to be represented by the class, Capitalize the first letter of each word.                                                                  ex) MyFirstClass, HelloWorld                                                        
- variable name : Noun for the contents to be stored, start with lower case.                 ex) numberOfStudents, intCount                                                   
- method name : Verb for the method action, start with lower case.                          ex)performAverage(self, val1, val2)                                                   
- method : function in class



---
## **Comments**



주석을 잘 다는것도 중요하다. comment area에 두면 declaration or execution에 아무런 영향을 안주니까 부담없이 달자.

''' ''' or """ """ or #



---
## **Data Type**



Python은 Data type이 없는게 아니라 나중에 **Assign** 되는 방식이다. 변수이름만 보고는 내용물의 Data type을 알 수가 없는데, 나중에 저장이 되면 Variable에 Data type이 존재하게 되는 것 이다.

integer, float, ~~~, complex(복소수), character, ~~

ex) complex(3,4) = 4+3j complex.real , imag



---
## **Operators**



+, - *, /, %(modulo)



실수에 int()를 씌운다는건 **정수화시켰다**라고 말할 수 있는데, 이렇게 Data type을 바꾸는 것을  **Type Casting**이라고 한다.

ex) int(), str() ...

만약 float로 정수를 나누면 소수점 이하도 나오는데, 이런 경우에 파이썬은 정보량이 항상 많은 쪽으로 유지된다.

정보량 int<float



== is the equivalence of values

!= is the in-equivalence of values



swapping statement가 쉽게 가능.

num1, num2 = num2, num1

**핵 쉽네**

****
## **String**



데이터를 ' or "로 **wrap**해서 사용한다. String value는 **Equivalence Test**가 가능하다. String이라는것이 무엇인가의 **연속**인데 그중에서 **인덱스 값**을 이용해서 특정한 값에 접근할 수 있다. String variable은 사실상 **linear collection of letters**인거고, 그들은 index를 가지고 있다.

> **negative index**도 가능하다. ex) str[-1], str[-2]

String으로 여러가지 Operator가 가능한데, 그중에서 +가 제일 직관적이다.

`in`, `not in`로는 진위여부 확인이 가능하다. (긴 문자열 속에 짧은 문자열이 들어가 있느냐)

> **다시!** String은 index를 이용한 collection



---
## Index in Sequence



This index applies to **strings** as well as **tuples**, **lists**

-> Applies to any sequence variables

> **First element index** starts with 0



인덱스 하나하나를 찍을수도 있지만, ":"를 이용해서 범위를 지정할 수도 있다..

ex) 1:3 -> x:y 일 때 y 로 가기 직전에 멈춘다.

   1:9:2 -> x:y:z 일 때 **from x to y** with **z steps.**

   5::-1 에서 y의 default는 length of the sequence, z는 1.

  

len()는 string의 길이를 의미한다. (길이는 index보다 1이 크겠지.) negative step 일때는 **거꾸로** 출력됨.

- string -> 개별 문자들의 열

- index -> 열의 번호



---
## **List**



List is another type of **sequence variable**. string은 **",'로 문자열**을 지정할 수 있지만, **숫자같은 경우는 []**를 이용함.

- range(x,y,z) == xyz ---> from x to y , z is step size

 .(point)는 **instance**속에 있는 **method**를 쓰기위해 사용.

- lstTest.append("hey")

- del(lstTest[index])

- lstTest.reverse()

- lstTest.remove(element)

- lstTest.sort() ---> 오름차순으로 sorting을 해라

숫자가 아닌것은 ASKII로 바꿔서 숫자와 비교되고, 리스트에는 뭐든지 다 저장될 수 있다는 걸 기억하자.



---
## **Tuple**



**tuple은 list와 거의 동일**하지만 **Only different in changing values**.

즉, tuple은 value를 바꾸는걸 허락하지 않는다. 다시 말하면 item을 assign 하는것이 불가능하다. 왜이런것이 필요할까? 

여러사람이 프로그래밍하다보면 **constant(상수)표현이 필요하기 때문이다.**

고정되어야하는 값들이 있으니까, 그런것들을 표현하는데 쓰인다.

- tuple의 value들은 ()로 묶어줌(Parentheses)



---
## **Dictionary**



**collection variable type** 인데 **sequential** 하지 않다. keys와 values의 pair 형태로 되어있고,  pair들을 {}로 묶어줌.(Brace)

- dicTest[index] 가 아니고 dicTest[key], key에 대응하는 value를 return함.
  - dicTest.keys()
  - dicTest.values()
  - dicTest.items()



---
## **IF**

A **condition** **statement**

```python
if boolean:
    statement for True
elif boolean:
    statement for True
else:
    statements for False
```

파이썬에는 switch-case statement 없다. 위의 코드처럼 작성하면 되는데, indentations 주의해서 규칙적으로 들여써야지 block에 혼란이 안생긴다.



---
## **For** 

**For statement is A loop statement**

대표적인 loop statement

```python
for Variable in sequence:

  statements for loop

else:
```

else는 for-loop가 정상적으로 끝나면 else 구문을 실행하도록 사용하기도 한다.



### Useful statements for loops

- loop를 control하기 위한 control statement

- continue -> 만나는 즉시 for loop로 돌아가라!

- break -> 만나자마자 밖으로 튀어나가라(else까지 포함해서)

`for itr in range(y):`

range에 의해서 정의된 sequence가 하나하나 itr에 적용이 된다!



---
## **Function Statement** 

위의 다양한 statement들은 control를 위한 것이고, 이 부분은 Function을 정의하는 방법이다.

```python
​```
def : function정의하는 keyword
    
name : function's name
    
params : function's input

return : 결과물을 반환하는 keywork
​```

def name(params):
    statements
    return var1, var2 ...
```

`f(x) = ax + b` 에서, `x`가 params 라고 생각하면 되고, `ax + b` 가 statement

파이썬은 다른 언어와 다르게 return type이 존재하지 않는다. 계산된 값을 어떤형태로든, 몇개로든 return이 되는게 편리한 점 중 하나다.

> **You can return multiple variables.**

- 조심해야할건 **order**(순서)를 지켜서 return해야한다는 것이다.

One line function is called **lambda function**

```python
lambdaAdd = lambda numParam1, numParam2 : numParam1 + numParam2
```

다시 return type을 정의해줄 필요가 없다는 것의 장단점을 살펴보면

- 장점 : 편하고, 고민이 필요없음

- 단점 : 다른 언어는 계산하기전에 체크를 해볼 수 있는데, 파이썬은 에러가 나중에 발생한다.

-> **프로그램을 쉽게 짤 수 있지만, 나중에 에러가 생길 수 있다!**



---
# Sample Program : Finding Prime Numbers



알고리즘 정리하기

[jm-park님 블로그 참고](https://jm-park.github.io/algorithm/2018/08/06/Prime-Number(소수)-판별법-알고리즘.html)

<img src="/images/About PrimeNumber algorithm/1-2.png" width="800px" height="300px" align="center">   
<img src="/images/About PrimeNumber algorithm/3.png" width="400px" height="300px" align="center">   



---
# Assignment and Equivalence

리스트에 있는 다양한 값이라던가 **Object**를 비교하는 일이 간단한 일은 아니다. 매커니즘에 대한 이해가 필요하다. 같은 Type이 아니라면 비교조차 될 수 없기 때문이다. 또한 내부의 element에 대해서도 생각해보자.`list1`에 또다른 list `list2`를 넣으면 무슨일이 일어날지에 대해 생각해보면 리스트안에 또다른 리스트가 들어가있다, 즉 Nested 형태가 된다. 즉, list도 하나의 element가 될 수 있다는 것이다. 이렇게 활용성이 매우 크고, 그만큼 경우의수도 많은데, 그에 따른 규칙도 많기 때문에 잘 따라야한다.

아래에서는 `Reference`의 개념에 대해 다룬다.

```python
x = [1,2,3]
y = [100,x,120]
z = [x,'a','b']
```

위와 같은 코드가 있다고 할 때, 만약 x값을 바꾸고, 다른 List를 살펴보면, x라는 하나의 variable만 바뀌었을 뿐인데, 그것을 포함하고 있는 곳에도 변화가 있음을 확인할 수 있다. 왜? Because of references. y와 z에는 x의 값을 저장하는게 아니라 **x의 reference**가 있는 것이다.

- **reference == 화살표**

x has two references from y and z. The values of y and z are determined by x, and x is changed.

어떤값을 어떤 variable에 assignment할 때, 값이 실제로 들어갈 수도 있고, reference가 부여 될 수도 있는 것이다. primitive data type은 실제로 들어가고, object들은 reference 형태로 들어간다.(list, tuple, dictionary)

value 비교와 reference 비교를 하는 두가지 equivalence가 따로 있으니까 `reference`





## see the ripple effects



x의 change가 y와 z의 change를 일으켰다(incur)



**== : checks the equivalence of two referenced values**

**is : checks the equivalence of two referenced objects' IDs**



---
# Class and Instance



위에 "Assign Data"에서 primitive data가 아닌 것들에 대해서 이야기를 했는데, 이 외에도 Object가 엄청 많다.

> 설계도 = class

> 집 = instance


Class block는 몇개의 Variables 과, 몇개의 Functions으로 이루어져있다.

- Class block -> Class Definition Area

실제로 **Function call**이 일어나야 무언가 작동하지

homeAtDaejeon = MyHome()



실제로 사실 위의 코드도 function call인데, MyHome의 **constructor(생성자)를 콜하는 것**이다!

Constructor 의 return 은 하나의 Instance가 나와서 저장되는거



==**Note) primitive 아닌것들은 reference로 저장!**==


**primitive가 아닌 것**

**: List, tuple, dictionary ...**



여러개의 Instance를 선언했을 때,

Class는 같지만 **서로 다른 Instance**니까 **Reference는 다름**



==그리고 **self는 Instance 자기 자신**이다.==



Instance

: **Function**도 있고, 특성치를 저장하는 **Variable**도 독립적으로 가지고 있는게 바로 instance!



---
# Point Status



Class의 중요한 Method는 뭐가있을까



**Constructor(클래스를 선언할 때 call되는 Method!)**

**Deconstructor**



Class를 다시 보면,

Variable도 있고, Function도 있다.



def ____init____(self): 형식으로 되어있는건 뭘까?

==**Constructor라고 부르자라고 약속!**==

: It is called when instantiated



Constructor에서의 self는 좀 다른데, **self가 return 값**이라 생각하면될듯(Instance 그 자체)

이걸로 Instance를 초기화 할 때 사용하면 좋겠네~



Destructor는?

: It is called when the instance is removed from the value table

==**집을 무너뜨리는거!**==

= Instance를 없애는거!





---
# **Module and Import**



한 파일안에 여러클래스를 넣어놓기가 쉽지않으니,

**한 파일에는 하나의 클래스만 넣는걸 추천**



여러개의 **클래스를 엮어서 활용하고 싶을 땐** 어떻게 해야할까?



Home.py 먼저 보자



from time import ctime

// **time은 package이고, 그 안에 있는 ctime을 가져와라**

// **선물꾸러미 : package**



MyHome 이라는 Class는 Home.py에 있는 Class임

Member Variable: cololrRoof, stateDoor



그리고 각각의 Method들이 자신들의 Block안에서 자신을 Definition함



그리고 __init__ , __del__ 는 constructor와 destructor.



init안에 보면 ctime()이라는걸 쓰고있지

-> **얘를 사용하기 위해서는 from time import ctime을 해야하는거**



UsingMyHome.py를 보자



import Home

-> **Home.py를 실제로 가져온다!**



from time import ctime도 마찬가지

-> **time package안에 ctime을 가져온다.**



> **import Home을 하는 순간에 Home.py을 가져와서 미리 실행을 해본다.** 라는 개념



Home.MyHome("~~~~~") 을 수행한다는건 무슨의미?

-> **Home 속의 MyHome class를 활용하겠다.**



---
# Organizing Modules by Package



어떻게 Directory를 이용해서 import 할지?



Directory 구조

src/edu/kaist/seslab/le362/week1/~~~처럼 되어있고



그 안에 보면 **__init__.py** 가 있는데 얘는 뭐일까?

-> **특정 Directory가 python package라는걸 의미하는 File**



나머지는 week1안에 있는 **Class들을 정의해논 .py file들임**



그래서 만약 src에 내가 작성한 파일이 있다고할 때



**from edu.kaist.seslab.le362.week1 import Home**



**뒤에 .py file import할때는 with extension으로**

==**from 은 만약 같은 디렉토리에 있는걸 import할때 생략가능**==





---
# Sample Program: Interaction with Your Program



위에서 부터 보면

CashierLine class의 Definition block



lstLine은 **Member Variable**



def로써 Definition되는 Function들은 **member function(method)**



line = CashierLine()

// **하나의 instance를 create해라! -> constructor call**



```py
class CashierLine:
    lstLine = []
    def addCustomer(self, strName):
        self.lstLine.append(strName)
    def processCustomer(self):
        strReturnName = self.lstLine[0]
        self.lstLine.remove(strReturnName)
        return strReturnName
    def printStatus(self):
        strReturn = ''
        for itr in range(len(self.lstLine)) :
            strReturn += self.lstLine[itr] + " "
        return strReturn
binLoop = True
line = CashierLine()
while binLoop:
    strName = input("Enter Customer Name : ")
    if strName == ".":
        break
    elif strName == "->":
        print("Processed : ", line.processCustomer())
        print("Line : ", line.printStatus())
    else:
        line.addCustomer(strName)
        print("Line : ", line.printStatus())
print("Number of remaining customers : ", len(line.lstLine))
```

이 코드를 따라해보면서 내가 몰랐던 것은..



Member Variable을 사용할때는 항상 앞에 **self**와 **". "**을 붙어서 사용해야 한다는거..

Method안에서 선언하고 사용하는 Variable 들에게는 필요없지만

**Member Variable은 Class전체에 영향을 주기때문인 것 같음..**



---
# 현장강의 Exercise



Remember! String is a array of characters



for loop

: Very important. Very simple **control statement**. manipulate program process.



Different class definition with function definition

: function definition is in definition.

 special cases function -> constructor, destructor.



Class is a setup function



**Program is divided largely in two parts**



- **Definition part**
- **Execution part**



sentidata =[]

for loop(sentidata.append(row))

: **create a 2-D array**



zip(v1,v2) statement

: **call elementwise pair of vector v1 and v2**



enumerate(list)

: **call indaex and value together**

ex) for index, value in enumerate(v1):

​     pirnt(index, value)



sum(list)

: **sum of list**



int(float(x))

: Convert a string type x into integer type -> type casting



List comprehension

: Make a list of value that satisfied the condition

list = [**value for loop(condition)**]



---

## **Offline Class Plan**



**Product Review and sentiment Analysis**


Product review(**positive or negative**), information.



What if we have 10,000 reviews and want to find the negative ones?



자신들의 제품을 어떤쪽으로 보완시켜야하는지 알기위해서

negative한 의견들을 모아서 보기위해 파악할수있는 프로그램.



**Why simple word searching doesn't work.**

-> 어떤것이 **대상이냐**에 따라서 단어에 따른 **평가가 좋은것일수도 있고 나쁜것일수도 있기 때문.**

ex) cool pizza, hot pizza, cool beer, hot beer



**For statistical analyses,**

How to represent description in a **numerical setting.**

**because we will use number.**



-> **W****e turned the review text into a vector(first method)**



**A vector <1,0,0,1>**

**A word list **

**Then the review contain "I" and "reliant"**



---

## **Conditional Probability and Bayes Theorem**



**"actually"** and **"positive"** review



H(hypothesis) : review is something that **we want to know.**

-> condition like **positive or negative.**


**E(evidence) **: word is something that **we can observe.

**H is given how is the probability of being E**



P(E='actually'|H='positive')

= P(H='positive' and E='actually') / P(H='positive')



P(E l H)를 P(H l E)로 만들면 그 힘을 볼수가 있음.



E를 알 수가 있으니까,

P(H l E) = P(E l H)P(H) / P(E)

**Formula를 통해서 P(H)를 구할 수가 있다.**



==**Many words == many evidence E, such as E1, E2, E3, E4....**==

수많은 word들이 있을것이다.



**만약 review에 N개의 word가 있다고했을 때**

==**N개의 evidence를 가지고 있는거.**==



**여기서 simple하지만 big한 assumption을 해준다.**

- Each word usage is independent to other word usages given a sentiment label.
- Not true, but make things easy.
- This means that E1,..En are independent events.



이제 Bayes theorem을 이용해서

Review가 positive 인지 negative인지,

어떤 word가 들어갔을 때 review가 positive인 확률은 얼마인지 구할 수 있는것이다.



[winner님 블로그에서 보고 필기한 내용입니다.](https://j1w2k3.tistory.com/1009)

<img src="/images/About Bayes Theorem/1-2.png" width="800px" height="300px" align="center">   
<img src="/images/About Bayes Theorem/3-4.png" width="800px" height="300px" align="center">   
<img src="/images/About Bayes Theorem/5-6.png" width="800px" height="300px" align="center"> 


2번째에서 공식이 근사화되고,

마지막에 나온 Result를 보면 같음.




