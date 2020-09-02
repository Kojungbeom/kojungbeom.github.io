---
title:  "Data Structure week2"
excerpt: "문일철 교수님의 데이터 구조 및 분석 Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다."
date: 2020-3-24 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
lastmod : 2020-3-27 12:00:00
---



---

# Data Structure Week 2

KAIST 산업및시스템공학과 문일철 교수님의

[데이터 구조 및 분석: Linear Structure and Dynamic Programming](https://www.edwith.org/datastructure-2019s/joinLectures/21992)

[edwith](https://www.edwith.org/) 강의를 보고 정리한 내용입니다.



## Weekly Objectives

This week, we learn the object-oriented paradigm (OOP) and the basic of software design.



Objectives are

- Understanding object-oriented concepts Class, instance, inheritance, encapsulation, polymorphism....
- Understanding a formal representation of software design Memorizing a number of Unified Modeling Language Notations 
- Understanding a number of software design patterns Factory, Adapter, Bridge, Composite, Observer                                       Memorizing their semantics and structures



앞에서는 프로그래밍하는 방법을 배웠고,

이번에는 **잘 설계하는 방법**에 대해서 알려주신다고 합니다.

이번주차에서는 ==**OOP**와 **Basic of software Design**==에 대해서 배웁니다.



적어도 설계도를 보고 읽을 수 있고,

어떤 디자인인지 스스로 감은 잡을 수 있도록 되어야합니다.



앞의 내용을 다시한번 이야기해보면,

- Software Design 은 설계도
- Software Implementation 은 실제 시공
- Python 은 시공에 쓰이는 중장비



Lobby1, Lobby2

같은 경우 **비슷한 역할**을 하고, **비슷한 디자인**이 적용이 되지만

**디테일은 다릅니다.** (특성의 값이 다르다.)

어떻게하면 **기존의 설계를 재사용**하고, **일관성을 유지**하는지가 중요한 요소가 됩니다.



---
## Good Software Design

**Correctness**

- **Client의 목적**에 맞아야함.

- Error가 없어야함.

  

**Robustness**

- 예상되는 사용자들의 **실수에도 잘 실행될 수 있도록.**



**Flexibility**

- **유연하게 업데이트**될 수 있어야함



**Usability and Reusability**

- 디자인 목적에 대해 **좋은 support**를 해줘야함.(Interface or comment)
- 다른 **목적**에도 쓸 수 있으면 좋도록.
- 다른 **환경**에서도 사용할 수 있도록.



**Efficiency**

**두가지 차원**에서의 efficiency

- 쉽게 **구현**할 수있도록

- 빠르게 **실행**되도록

  

이런것들을 외울 필요는 없지만,

이런것들이 중요하겠구나 라는 생각은 가져야한다.

   

---
## Object-Oriented Design

설계라는것은 **Real-world의 개념을 추상화**하여서

프로그램으로 만들수있는 설계로 나타내는것이 좋은 설계다.

= **현실에서의 개념을 프로그램 모듈로 만들어내는 과정**



은행 시스템의 Concept에는 무엇이 있을까

- Customer
- Transaction
- Banking



그렇다면 현실에 존재하는 Concept을 어떻게 프로그래밍 모듈로 만들것인가?

1. Concept의 **이름**
   
+ 계좌를 가진사람 == customer(개념이름)
  
2. Concept이 가지고있는 **상태**, **특징점**
   
+ **정적이지만, 특정 시점마다 어떤 값은 가지고 있어야한다.**
  
     (Attribute or Member variable // ID, AccountNum같은 개념의 특성)

3. Concept이 할 수 있는 **행동**
   
   + login, confirmSecurityCard 같은거(개념의 행동)



Transaction 행위도 위처럼 표현한다면?

- Transaction (Concept의 이름)
- amount, releaseATMID (Concept의 특성)
- releaseMoney (Concept이 하는 행동)

Real World Concepts 

**이렇게 Concept의 이름,특성,행동을 정의하는것을 Abstarction이라고 한다.**



**Abstract** 

: 소프트웨어를 **설계하는 목적**에 맞게 끔 **Concept을 간략화 한거!**(Software Design Entities로 !!)



프로그래밍에서 Class와 Instance에 대해 먼저 살펴보면,

**What are Class and Instance?**

Class vs Instance

**Class**

- Result of design and implementation

- Conceptualization (특성, 행동 간략화)

- corresponds to design abstarctions

  

**Instance**

- Result of execution

- Realization

- corresponds to real world entities

  

**Class**라는건 사실 하나의 **Design(definition)**이다.

Real world의 Concept을 파이썬에서 Class로 만들어낸다.



Class를 이용해서

개체마다 바뀌는 Concept의 특성을 반영하여 **여러개의 instance**를 만들 수 있다.



메모리상에서, **Class**는 **미리** 설계하고 구현-> 몇개인지 알 수 있다.

하지만 **Instance**는 소프트웨어를 **돌려봐야지만** 몇개가 있는지 알 수 있다.



추상화를 통해서 균일하게 설계된 **여러개의 Instance를 만들어낼 수 있다.**

**하나의 설계를 이용**해서 실제로 존재하는 **여러 Entities를 표현**하는 것이다.

   

---
## Software Design as House Floorplan

Software 디자인은 **평면도**를 만드는것과 같다.

평면도는 마음대로 그린것이 아니라,

**[작성 표준](#)**에 맞춰서 그려야 하는데 Software 디자인에도 작성 표준이 있다.



이런 작성 표준을 알아야하는 이유는 무엇일까?

Developing software에는 두가지 행위가 필요하다

- Mainly design
- some coding

여기서 Design이 주가 됨.



**Need to learn how to communicate with your colleagues**

- Learn standard.
- Learn how to represent your design to your boss.



같이 일하는 동료, 혹은 상사와의 Communication을 위해 알아야 할 

**소프트웨어를 설계하는 표준을 UML (Unified Modeling Language)이라고 한다.**



현실에 있는 다양한 Entities들을 **UML**이라는 표준을 통해서

**추상화하여 표현하는 방법을 알아야한다.**

   

---

## UML notation : Class and Instance

이 부분은 수업이나 UML 그림을 보면서 하시는것을 추천.

<div class="mermaid">
    classDiagram
	class Customer{
		-ID : String
		#AccountNum : Interger
		+name : String = Hey
		+login() : void
		+requestWithdrwal() : Boolean
		+confirmSecurityCard() : Boolean
	} 
</div>



- Abstract class : person
- Clas : Customer
- Unnamed instance : Customer
  - instanceName::className 으로 표현함
  - instacneName이 안 정해졌으면 그냥 className



ID, AccountNum, Name은 **Member variable**(attribute, property)

- +-#(name):(type)=(default value)의 형식으로 기입



Login, requestWithdrawal, confirmSecurityCard는 **Method**(member function)

- +-#(name)(arguments):**(type)**의 형식으로 기입

Method에서의 type은 **return되는 녀석의 type을 의미한다.**

arguments는 괄호속에 정의한다.



==**Visibility options**==

- \- 는 private
- \+ 는 public
- \# 는 protected



현실에서 선호되는 방식은 -(private)

**보통 method를 이용해서 데이터에 접근하도록 만든다.**

​    

---
## Encapsulation

- 클래스 설계 또는 디자인 스타일
- **클래스 내부**에 **모든내용**이 쌓여있어야하고, **외부**에서는 **Method**로 **접근**할 수 있어야한다는 개념.



**Object = Data + Behavior**

Data : Field, Member Variable, Attribute

Behavior : Method, Member Function, Operation



**Encapsulation하는 것의 장점** 

- 구현에 대한 책임을 Delegate함

Delegating the implementation responsibility.

[Delegate에 대한 자세한 글](https://mrw0119.tistory.com/19)



데이터를 변형하는것은 내가 짜논 behavior로만 한다.

> **Bring me a sausage, and i don't care how you made it**

​    

---
## **Utilizing the visibility**

**위의 Encapsulation **은 **visibility option**을 이용해서 구현가능

- Public : many can see.
- Protected : seen only within the class and its descendants.
- Private : only i can see.



**Method는 public하고**

**Data는 private로 해서 구현한다.**



Python은 기본적으로는 Visibility options을 지원하진 않지만,

나름대로 **약속**은 가능

**ex)____var1___ mean "다른 사람이 안썼으면 좋겠다."**라는 의미를 담고있다.

   

---
## Inheritance

> **Giving my attributes to my descendants**

 **My attributes include member variables and Methods**

(여기서는 member variable 의미하는 그 attribute가 아니라, member function까지 포함하는 의미로 쓰임.)



**자식들은 새로운 Attribute를 새로 가질 수도 있다.**

- 자손들은 내가 가졌던 Attribute들을 **Mask하고 자기 나름대로 바꾸어 나감.**
- 위의 경우가 아닌경우, 물려준 성질을 따른다.



필연적으로 두개의 역할이 생겨남

- **Superclass(부모 클래스)**

  + Generalized from the conceptual view 

    ->새롭지 않고, **전형적이고 일반적인 특성**만 가지고있음.

- **Subclass(자식 클래스)**

  + Specialized from conceptual view

    -> **새롭고 특별한 특성**도 있다.



c++이나 python은 **여러개의 class에서 상속가능** (Multiple inheritance)

**Subclass에 superclass의 attribute와 method가 다 들어가있다.**

   

---
### Inheritance in Python

Program Language마다 상속하는 방법은 조금씩 다르다.

Python에서 Object라는것은 **가장 상위**의 시조, 조상

괄호에 아무것도 넣지않아서 아무것도 상속받지 않은것 같지만, 기본적으로 Object에서 상속받는다.

- (object) = ()



class father(object):

있고

class mother(object):

있으면

class Child(Father, Mother):

  def __init__(self):

​    super(Child, self).__init__()



**super**

- inherite하고있는 **상위단계**의 class를 call한다.
- **이름이 겹치는 method**가 있으면 **child껄로 overriding** 된다.



**self and super**

**self** 

- reference variable **pointing the instance itself**

- 자기자신을 가리킨다.

**super**

- reference variable **pointing the base class instance**

- **super는 Base class methods 를 call한다.**

  -> **첫번째 inheritance를 찾는다.**



이렇게 Multiple inheritance 상황에서는 **super는 첫번째 inherit받는 녀석을 call함**

-> 반대로 말하면 첫번째 inheritance를 찾기위해서는 super를 이용하면 된다.

   

---
## **Polymorphism**

Poly : Many

Morph : Shape

단어를 직역하면 **"다양한 모양"**

- **Different behaviors with similar**( ex) 점박이 인것은 동일하지만 밝은색인지 어두운색인지)

**

유사한 Signature**를 가지고 있지만** 다른 행동을 할 때

**Polymorphism이 적용됐다라고 한다.**



== **signature = Method name + parameter lists** ==

**Signature로 어떤 Method가 어떤 Method인지 구분할 수 있다. (?)**



Polymorphism은 **상속**이라는 개념이 적용되었을 때 사용한다.

Polymorphism의 **하위 개념**으로

> **Method Overriding**
>
> > 부모class와 자식class의 **method의 method name 과 parameter list가 같을 때**
> >
> > Base class has a method A(num), and its derived class has a method A(num)
> >
> > -> **Base class에 있는 동일한 method signature를 엎어쳐서 새로이 정의된 method로 실행한다.**



> **Method Overloading**
>
> > Method name은 동일하지만 **Parameter가 달라서** 다양하게 사용 가능하다.
> >
> > A class has a method A(num), A(num, name).....
> >
> > -> **Parameter가 다를 때 어떻게 실행하느냐를 정의한다**

​    

---
## Abstract Class

Abstarct Class, or Abstarct Base Class in python

Abstract Class란?

- **Abstract Method가 있는 Class**

Method가 **Signature part**만 정의되어 있다. (Implementation가 없다.)



**동작을 못하는데 왜 필요할까?**

ex) 

사람이 여러명이서 작업할 때, 창문을 만든다고 했을 때

 **"창문이 반드시 열리긴해야돼. 근데 어떻게 열릴지는 너네가 알아서해"**라고 할 때,

창문을 열리게 만들기만 하면, 나머지는 내 마음대로 하면된다. 

Entity의 기본적인 특성을 지키면서, 그 안에서 자유롭게 Customize할 수 있도록하기 위함이다.



**Abstract class in not a complete implemetation,**

**it is more like a half-made produce.**



결국 **이걸로 Instance를 만들수는 없다.**



The **concrete class with full implementations** and

**inheriting** the abstract class will be a basis for instances.



일반적인 클래스가 Abstarct class를 I**nherit**하고 **override**해서, 그래서 풀 구현을 하고,

자식 클래스를 이용해서 **Instantiate** 해서 활용한다.



**디자인을 하면 이런 Abstract Class가 유용하게 사용될 수 있을 것이다!**

​    

---
## **Overriding Methods in Object**

Base class를 Specify하지 않더라도, **Base class로 Object를 그대로 받아온다.**

(Object는 가장 상위의 조상님)

**Object에는 속에 사용자가 정의한 내용은 아무것도 없다.**

**하지만 Python에서 정의한 내용이 숨겨져 있다.**



기본 method를 override해서 유용하게 사용가능

- __init__ -> constructor 기본적인 initialize setting을 한다.
- __del__ -> destructor
- __eq__ -> memory space를 건들지 않고 값을 비교한다.( == )
- __cmp__ -> comparison 대소를 비교한다.
- __add__ -> 덧셈을 한다.

기본적인 기능을 더 쉽게할 수 있게 만드는 Method들이다.

​    

---
## **Duck Typing**

Instance끼리 비교하는 Method일 때, **항상 같은 Class가 들어가지 않을 수도 있다.**

이런 경우를 **고려를 해야하는데**, 그러지 않고 짠 코드를 **Duck Typing**이라고 부른다.

-> 실행타임에서 오류가 발생한다. (Interpret 언어의 특성)



> **EAFP(Easier to Ask for Forgiveness then Permission)**
>
> > ==**그냥 나중에 실행타임에 가서 에러를 내자라는 방식임.**==

​    

---

**More about UML Notations**

얘도 그림보시면서..


현실에는 다양한 **UML diagram**있음

class, state, use-case, deployment

지금까지는 class diagram에 대해서만 했다.

그 외에도 다양한 UML Diagram이 있다.

- Use-case :  **상호작용을 보여준다**
- State : method 속에 있는 내용이 어떻게 **점점점 개발할건지에 대한 순서도**
- Deployment : **Packaging**을 어떻게하고 어떤서버에 **어떻게** 올릴 것인가 등등..



> **Abstract class : Abstract method가 있는 class**



Abstract class -> class로 가져오려면 Method override(inheritance)

**Same method signature일때 method override**,

**이름은 동일하고 parameter가 다를때 method overload 한다.**

​    

---
## Structure of Classes in Class Diagram

What makes a structure?

-> Entity and Relationship

- **Association**은 어떤 관계를 맺고 있는지, (화살표, )
- **Generalization**은 상속관계를, (삼각형 화살표, hallow point arrow)
- **Aggregation**(마름모 화살표)

위 **화살표**들을 가지고 이어져있으면,

**뭔가 관계가 있다!** 라는걸 알 수 있다.

​    

---
## Generalization

**근본적으로 inheritance relationship에 기반을 둔다.**

Inheritance는 필연적으로 두가지 다른 타입의 class를 만들어낸다고 했다.

- Super class
- Sub class



**is-a relationship**의 관계



**Direction of generalization**

ex) "Customer" is a "Person"

**sub -> super 방향**

**customer -> person**

**From** sub class, **to** super class



모양은 **Hollow triangle shape**이다.

**Base class**가 person이 되고

**Leaf class**가 Park::Customer



Note)

> Sub class에는 Super class의 Member variable과 Member function이 
>
> 선언하지않아도 있다는걸 기억하자! Method overload, Method override

   

---
## Association

**has-a relationship**의 관계

(어떤 클래스가 무엇을 가지고 있다.)



**Member variables과 연관이 되어있다.**

- A customer has a number of holding accounts.

- An account has an account holder customer.



기본적으로 필요한 정보

- **Multiplicity에 대한 정보(1 : 多, 多 : 1, ...)**
  - 알맞게 기입해주어야 한다.



**Simple Line**으로 표현 ( Generalization은 Hollow triangle shape )

만약 Simple arrow가 붙으면,

- A customer has a **reference** to bank accounts

- A bank account has a **reference** to a customer

  -> 방향을 나타내주기 위한 표현이 됨! (**Navigability**)

  (쌍방향으로 있을수도 있음)



Account holder

Holding accounts



**1과 \*는 1 to Many의 관계를 의미한다.**

-> customer하나에 bank account가 여러개 된다.

​    

---
### **Multiplicity of Association**

- *often means many.

- 1..* means 1 to many, * means 0 to many.

- 1 -> exactly one,
-  0..1 -> one or zero.
- 아무것도 표기하기 않았을 때 default는 1이다.

​    

---
## **Aggregation**

**Special case of association**

= Special has-a relationship

**More like, part-whole or part-of relationship**

**변형된 has-a 관계**

**Hollow diamond shape 으로 표현**



**Aggregation에서 어떤 Special한 의미가 나오는 것 일까?**

- **가족구성원이 하나도 없는 가족은 존재할 수 없다.**

여러명일때는 괜찮지만, 0명일때는 안된다.

가족구성원이 없다면, **Family 자체도 메모리 상에서 없애버려야된다.**

> **If nothing to aggregate, there is no family.**



**Aggregation often occur**

- when an aggregating class is a collection class 일때!
- when the collection class's life cycle depends on the collected classes.



항상 FamilyMember를 관리를 해서 **Family의 존재유무를 체크해야한다.**

​    

---
## **Dependency**

**Use Relationship**

**다른걸 import해서 활용한다.**

Method는 잘 활용되겠다. 저장의 용도는 아니다.



활용했다는걸 표현할때는 **점선과 Simple arrow shape으로 표현.**



Member variable로 관계되지않는다.

-> Local variable ....

​    

---
## Let's practice

​    

<img src="/images/About Reading UML diagram/1-2.png" width="800px" height="300px" align="center"> 


시나리오가 주어지면 그릴 수 도 있어야하고,

읽을수도 있어야한다.



Archetype 이라고 하는것은 마치 templete과 같은 것 이다.



이런 목적을 위해서 설계를 하는 **Pattern**이 존재한다.

​    

---
## **현장강의 Exercise 2**

​     

Diagram를 배우는 이유?

엔지니어라면 알아야한다. (소통을 위해서)

내가 UML에 맞게 그려놓으면, 다른 엔지니어들이 알 수 있도록..

Class is one templete, instance made with the templete.



Objective

- Make the complete analysis : calculate the analysis accuracy
- Use the attribute of classes
- Make the charts


표준편차 구하는법

standard devation

<img src="/images/About Standard Deviation/1-2.png" width="800px" height="300px" align="center">   




