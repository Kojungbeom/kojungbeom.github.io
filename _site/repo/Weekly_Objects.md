이번에는 Data structure week 1~5까지의 Weekly Objects들을 모아서,

보면서 복습을 해보도록 하겠습니다. 

---

# Weekly Objects week 1

This week, we review Python that will be used for a programming language for this course.

Objectives are

- Setting up the Python development environment
- Executing “Hello world” program
- Memorizing basic grammar of Python
- Understanding Python programming structure
- Understanding the reference of Python variables
- Understanding control and loop statements
- Understanding function calls and class declarations
- Understanding list, tuple, and dictionary in Python
- Executing a sample GUI program

1주차 강의에서는 기본적인 Python문법, 용어들의 정의에 대해서 배웠습니다.

[1주차 강의](https://kojungbeom.github.io/data%20structure/2020/03/21/Data_structure_week1-post/)



---

## Data structure and Algorithm

### Algorithm

: Algorithm is a step-by-step procedure, which defines a set of instructions to be executed in a certain order to get the desired output. 



### Data structure

:  A data structure is a data organization, management, storage format that enables efficient access and modification



**Data Structure**가 방 배치를 어떻게 할것인가라면,

**Algorithm**은 어떻게 그 방을 찾을까.

> **사람들이 방을 어떻게 찾을지를 고려하여, -> Algorithm**
>
> **방 배치에 반영한다. -> Data structure**



---

## Python의 특성

- Interperter 언어 (먼저 실행하고 나중에 Error나도록)
  - 빠른 개발, 느린 실행
- Object-oriented (week2에서 자세하게 다룸)
- Dynamic type of variables
  - Data type을 명시하지 않음



## Basic grammar of Python

- 다양한 Data type
  - String, int, float, complex, character, List, tuple, dictionary ...
- 다양한 Statement
  - Condition Statement
    - If
    - Python에는 switch-case는 없음
  - Loop Statement
    - for
    - while
  - Control Statement
    - continue
    - break
  - Function Statement



## reference

- Reference : 메모리 상에 해당하는 variable를 가리키는 화살표

- Variable : Value를 담고있는 메모리상의 한 공간



## list, tuple, and dictionary

List, Tuple

- Sequence Variable
- Index
- Tuple은 경우는 value를 change 할 수 없다.
  - 여러사람이 같이 프로그래밍 할 경우에 constant(상수)표현할 때 쓰인다.

Dictionary

- Collection Variable
- Key와 values의 Pair 형태
- Key에 대응하는 value를 return한다.

---



여기까지가 Week1 요약입니다. Algorithm과 Data Structure의 정의, 

그리고 그 둘의 깊은 **연관성**에 대해 인지하고 넘어가면 될 것 같습니다.



---

# Weekly Objects week 2

This week, we learn the object-oriented paradigm (OOP) and the basic of software design.

Objectives are

- Understanding object-oriented concepts
  - Class, instance, inheritance, encapsulation, polymorphism…

- Understanding a formal representation of software design
  - Memorizing a number of Unified Modeling Language (UML) notations

- Understanding a number of software design patterns
  - Factory, Adapter, Bridge, Composite, Observer
  - Memorizing their semantics and structures



2주차 강의에서는 Program을 잘 설계하는 방법에 대해서 배웠습니다.

좋은 Software design의 기준에는 5가지가 있었습니다.

- Correctness
- Robustness
- Flexibility
- Usability and Reusability
- Efficiency

[2주차 강의](https://kojungbeom.github.io/data%20structure/2020/03/21/Data_structure_week2-post/)



---

## object-oriented concepts

### Class

- Conceptualization
- Corresponds to design abstractions

### Instance

- Result of execution
- Realization
- Corresponds to real world entities

Class라는 건 하나의 Design(Definition), 설계도이고,

Instance는 그 설계도를 통해 만들어진 Entities다.



### OOP (Object-Oriented Programming)'s 4 Pillars

- Encapsulation
- Abstraction
- Inheritance
- Polymorphism



#### Encapsulation

: Group related variable and functions that operate on them into objects

- 클래스 설계 또는 디자인 스타일 
- Object =  Data + Behavior
  - Data : Variable, field ...
  - Behavior : Function, method ...
- 장점은 구현에 대한 책임을 Delegate한다는 것



#### Abstraction

: 복잡한 자료, 모듈, 시스템 등으로부터 핵심적인 개념 또는 기능을 간추려 내는 것 ([위키백과]([https://ko.wikipedia.org/wiki/%EC%B6%94%EC%83%81%ED%99%94_(%EC%BB%B4%ED%93%A8%ED%84%B0_%EA%B3%BC%ED%95%99)](https://ko.wikipedia.org/wiki/추상화_(컴퓨터_과학))))

- Method signature만 정의해둔 Class를 Abstract Clss (Abstract Method를 가진 Class)

- Abstract Class를 다른 Class에서 상속받아서 사용함

  - ex) Room 이라는 Abstract Class를

    - Bedroom
    - Bathroom
    - Restroom

    같은 Class에서 상속받아서 그 Signature의 속내용을 따로따로 Customizing



#### Inheritance (상속)

: Inheritance한 Class의 Attributes들을 Inheritance받은 Class에서 자기것처럼 쓸 수 있도록 한 것

- Giving my attributes to my descendants (여기서 attribute = function + variable)
- 필연적으로 부모클래스, 자식클래스가 생겨남
- Object가 가장 상위 클래스
- mechanism that allow you to eliminate redundant code.
- Instead of redefining all these properties and methods for everything, we can define them once in a generic object.

자식들은 물려받은 Attribute를 Mask하고 자기 나름대로 바꾸어 나간다.



#### Polymorphism

: 유사한 Signature를 가지고 있지만, 다른 행동을 할 때 Polymorphism이 적용됐다라고 함.

(Signature = Method name + parameter list)

- 상속이라는 개념이 적용되었을 때를 가정
- 하위 개념으로 Method Overriding, Method Overloading

  

---



여기까지가 Week2 요약입니다. OOP와 그 4가지의 Pillar에 대해서 정리했습니다. 

오히려 이 부분은 본문보다 내용이 더 많아진것같은데, 저도 보다보니 개념들을 

매끄럽게 생각하기가 어려워서 [Programming with Mosh 채널](https://www.youtube.com/watch?v=pTB0EiLXUC8)의 OOP에 대한 영상을 보고 

내용을 보강해봤습니다. 



---

# Weekly Objects week 3

This week, we learn the first set of data structures: Linked list, stack, and queue.



Objectives are

- Understanding the definition of **abstract data types**
- Firmly understanding how **references work**
- Understanding various linked list, stack, and queue structure
  - **Singly linked list**, doubly linked list, circular linked list..
  - Able to implement a **stack** and a **queue** with a list
- Understanding the **procedures** of linked list, stack, and queue management
  - Insert, delete, search...
  - Should be able to estimate the number of steps for inserts, deletes, and searches.

3주차에서는 Linked List, Stack, Queue같은 Data structure를 실제로 구현했습니다.

[3주차 강의](https://kojungbeom.github.io/data%20structure/2020/03/21/Data_structure_week3-post/)



---

## Abstract Data Type

ex) ADT modeling a simple stock trading system(주식 매매 시스템)

- **The data stored** are buy/sell orders

- The **operations on the data** supported are

  - order buy
  - order sell
  - void cancel

- **Error conditions**:

  - Buy/sell a nonexistent stock(없는 주식을 사는 경우)
  - cancel a nonexistent order(없는 주문을 취소하는 경우)

  

> **내부가 어떻게 되어있는지는 알지 못하지만, 무슨 데이터인지,**
>
> **어떤 operation에 의해 영향을 받는지는 명시를 하겠다.**



---

## Array vs Linked List

Array

- Index구조
- Element가 많아지게 된다면, Insert, Delete같은 Operation에서 N번의 반복이 필요하게 됨



Linked List 

- Reference구조
- Element가 많아지더라도 Insert와 Delete operation에 필요한 일의 양은 그대로이다.

- Node라는 Class를 만들어서 구현



---

## Stack and Queue

Stack :

- Last-In-First-Out (LIFO)
- Push and Pop

Queue:

- First-In-First-Out (FIFO)
- Enqueue and Dequeue



---

# Weekly Objects week 4

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



4주차에서는 Recursion(재귀)와 Dynamic Programming에 대해서 배웠습니다. 두 방법의 개념과 방법, 그리고 차이점에 대해서 잘 정리하고 넘어가는게 좋을 것 같습니다.

[4주차 강의](https://kojungbeom.github.io/data%20structure/2020/03/21/Data_structure_week4-post/)



---

## Recursion

: A **programming method** to **handle** the **repeating items in a self-similar way**

<div class="mermaid">
  graph TD
  A["P(5)"] --> B["P(4)"]
  A --> C["P(3)"]
  B --> F["P(3)"]
  F --> H["P(2)"]
  F --> I["P(1)"]
  H --> J["P(1)"]
  H --> K["P(0)"]
  B --> G["P(2)"]
  G --> L["P(1)"]
  G --> M["P(0)"]
  C --> D["P(2)"]
  C --> E["P(1)"]
  D --> P["P(1)"]
  D --> O["P(0)"]
</div>





---

# Weekly Objects week 5

Weekly Objectives

- This week, we briefly learn the concept and the application of conputer simulations
  - Introduction purpose

Objectives are

- Understanding the concepts of modeling and simulation.





[5주차 강의](https://kojungbeom.github.io/data%20structure/2020/03/21/Data_structure_week5-post/)



---