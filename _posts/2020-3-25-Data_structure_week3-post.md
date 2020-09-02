---
title:  "Data Structure week3"
excerpt: "문일철 교수님의 데이터 구조 및 분석: Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다."
date: 2020-3-25 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
lastmod : 2020-3-27 12:00:00
sitemap :
changefreq : daily
priority : 1.0
---



# Data Structure Week 3

KAIST 산업및시스템공학과 문일철 교수님의

[데이터 구조 및 분석: Linear Structure and Dynamic Programming](https://www.edwith.org/datastructure-2019s/joinLectures/21992)

[edwith](https://www.edwith.org/) 강의를 보고 정리한 내용입니다.



## Weekly Objectives

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



==**References structure는 정확히 알고 있어야 함!!**==



---

## Array for List

List는 왜 사용할까?

ex) 

학교 매점은 번호표가 없기 때문에 **먼저 온 순서에 관계없이** 목소리가 큰 사람, 팔이 긴 사람이 먼저 간식을 사가는 경우가 있다. 이런 경우 매점 안은 **난장판**인 경우가 많다. 하지만 은행이나 우체국처럼 **번호표가 있다면**, 사람들은 순서에 맞춰서 자신의 차례를 기다리면 되기 때문에, 난장판이 되지 않는다.

List는 바로 번호표와 같은 역할을 한다. 각각의 element에 번호표를 부여하여 Data를 효율적으로 관리 할 수 있는것이다.

- List란 Data를 구조화 된 형태로 만들 수 있는 도구

   

---

## Abstract Data Types

An abstract data type( ADT ) is an abstraction of a data structure

Abstraction(추상화)란?

- 현실에 있는 것의 **느낌**이라던가, **내제되있는걸 간단화**해서 표현하는 것

그렇다면 **Data structure의 추상화**란?

- Store, search, insert, delete같이 데이터에 대한 operation을  있는 그대로 상세히 표현한게 아니라, **추상적으로 표현하는 것 이다.**

3가지를 필수적으로 표현해야한다.

An ADT specifies:

- Data stored (어떤 데이터가 저장되는지)

- **Operations** on the data (그 데이터를 가지고 어떤 operation을 하는지)

- **Error conditions** associated with operations 

  (예외처리는 어떻게하는지, 자리가 없는데 insert, 없는데 delete같은거)

ex) ADT modeling a simple stock trading system(주식 매매 시스템)

- The data stored are buy/sell **orders**
- The **operations** supported are
  - order buy
  - order sell
  - void cancel
- **Error conditions**:
  - Buy/sell a nonexistent stock(없는 주식을 사는 경우)
  - cancel a nonexistent order(없는 주문을 취소하는 경우)



내부가 어떻게 되있는지는 알지 못하지만, 무슨 데이터를 가지고,

어떤 operation을 사용할 것인지는 명시를 하겠다! 라고 하는것이 바로 ADT



---

## Creating a List by Array

  Python에서는 List가 Array 역할을 한다.

**Array**

- 각각의 **element는 index**가 있어야함
- **index는 0부터 시작함**



---

## Search Procedure in Array

   

**ex) 'd'와 'c'를 앞에서 정의한 Array에서 찾는다고 하자**

(Python에서는 그냥 'in'예약어를 쓰면 되긴하지만, index를 navigating을 연습해보자.)

(From the first to the last until hit is the only way)



Array의 Length만큼 retrievals를 했는데 찾으려는 Element가 없다면?

-> 그 element는 그 Array속에 없다.

찾는 Element가 Array속에 없다는 **사실을 보장하기 위해서는!**

저장되어있는 **데이터의 개수만큼은 비교를 해봐야한다.**



---

## Insert Procedure in Array

   ==**ex) 'b'와 'd' 사이에 'c'를 Insert**==

1. 새로운 List를 만든다. (새로운 Element가 Insert됐을때의 길이를 가진 리스트, List y)
2. Reference를 insert할 공간(이 공간의 index를 a라고 가정) 직전까지 copy
3. c의 reference를 y[a]에 넣는다.
4. 나머지 남은 Reference들을 넣는다
5. List x의 reference를 List y의 reference로 바꾼다. (마지막에 x=y)
6. Total count of retrievals = a + 1 + n - a - 1 = n

> **Insert할때는 n번의 search retrievals정도가 필요하다.**

```python
x = ['a', 'b', 'c', 'd', 'e', f]
idxInsert = 2
valInsert = 'c'

y = range(6)
for itr in range(0, idxInsert):
	y[itr] = x[itr]
y[idxInsert] = valInsert
for itr in range(idxInsert, len(x)):
	y[itr+1] = x[itr]
x = y	
```



---

## Delete Procedure in Array

  ex) 'd'를 list에서 Delete

1. 새로운 List y를 만든다. (Element가 Delete됐을때의 길이를 가진 리스트)
2. Delete 하려는 Element 전까지는 동일한 값을 reference하니까 그대로 copy
3. Delete 하려는 Element는 놔두고, 그 다음 순서의 Element들의 reference copy
4. x의 reference를 y의 reference로 바꾼다.
5. Total count of retrievals = a + n - a - 1 = n - 1

```python
x = ['a', 'b', 'c', 'd', 'e', f]
idxInsert = 2
valInsert = 'c'
idxDelete = 3

y = range(6)
for itr in range(0, idxDelete):
	y[itr] = x[itr]
y[idxInsert] = valInsert
for itr in range(idxDelete+1, len(x)):
	y[itr-1] = x[itr]
x = y	
```



---

## Problems in Array

   

Array의 문제점은?

==**element를 넣거나 뺄 때, line-wise retrievals가 필요하다.**==

-> 길면 길수록 부담이 됨.

- 시간 복잡도가 Data의 크기가 커지면 커질수록 같이 커진다.



ex) Airline passengers

한 사람이 줄에 끼어든다고 했을 때, 중간에 빈공간을 만들기위해 **한칸씩 밀고** 끼어들어야 함.

이때 다 한칸씩 이동시키는 것은 매우 번거롭다.

-> insert or delete하려면 모든 element를 다 건들어야 할 수도 있다. (ㅠ_ㅠ)



What-if we have a magic to create a space in the middle of the line?

- Array -> you are bounded to the 1-dimension that you have
- Linked list -> you are bounded no more!

 Array같이 index로 선형인 것 일 때 이런 마법은 일어날 수 없지만,

마법을 부리기 위해

**1차원적으로 등간격으로 정의된 space에 데이터를 더이상 저장하지 않겠다!**

-> **Linked List**



----

## Linked List

**Index**구조가 아닌 **Reference** 구조로, 중간에 공간을 만들어낼수 있는 Linked List!

> **Reference : 데이터의 위치를 가리키고 있는 것**

Reference에 대해서 다시 살펴보면,

```python
x = [1, 2, 3]

y = [100, x, 200]
```

이라고 할 때, x를 바꾸었을때, y도 같이 바뀌게 됨 왜냐면 y안에 있는 'x'는 'x'를 가리키고 있는 Reference이기 때문이다.

값이 동일하다는 건 무슨 의미를 가질까?

- x1과 x2에 [1,2,3]이 저장되어 있을 때 값은 같다.

- 하지만 저장된 곳은 다를 수 있다. -> Reference가 다를 수도 있다.



---

### Basic Structure: Singly linked list

Construct a singly linked list with **nodes and reference**

A node consists of

- A variable to hold a reference to its next node
- A variable to hold a reference to its value object

Special nodes: Head and Tail

- You can construct the singly linked list without them
- But, using them makes search, insert and delete more convenient

Generally, requires more coding than array

> **Node = reference to its object + reference to its next node**

Head는 리스트의 맨 처음 노드, Tail은 리스트의 맨 마지막 노드

원래 Node에는 두가지 variable이 있는데, Head를 보면 object에는 저장되어 있는건 없지만, reference로 다음값을 가리키고는 있다. Tail에는 아무것도 저장되어 있지않고, Next가 없다.



---

### Implementation of Node class

  **Member Variables**

- 다음 노드를 가리키는 variable
- value object를 hold하고 있는 variable
- (선택) Head node가 있는지 없는지
- (선택) Tail node가 있는지 없는지



**Member Functions**

- Various set/get methods



```python
Class Node:
    # essential
	nodeNext = ''
	objValue = ''
    # optional
	binHead = False
	binTail = False
	def __init__(self, objValue='', nodeNext='', binHead=False, binTail=False):
		self.objValue = objValue
		self.nodeNext = nodeNext
		self.binHead = binHead
		self.binTail = binTail
	def getValue(self):
		return self.objValue
	def setValue(self, objValue):
		return self.objValue = objValue
	def getNext(self):
		return self.nodeNext
	def setNext(self,nodeNext):
		return self.nodeNext = nodeNext
	def isHead(self):
		return self.binHead
	def isTail(self):
		return self.binTail
    
node1 = Node(objValue = 'a')
nodeTail = Node(binTail = True)
nodeHead = Node(binHead = True)
```



---

### Head and Tail

Special한 Node

- Head : 항상 LinkedList의 맨 앞
- Tail : 항상 LinkedList의 맨 뒤
- These are the two corner stone showing the start and the end of the list

만약 Empty Linked List라면? Head 의 reference는 Tail을 가르키고 있고,Tail Node에는 아무것도 없다.

결국 Head와 Tail은 LinkedList에서 위치를 가리키기 위한 요소이다.(리스트의 범위를 알려주는 요소!) Head와 Tail없어도 구현은 가능하지만, 있는게 훨씬 convenient하다.



---

### Search procedure in singly linked list

**ex)  'd'와 'c'를 주어진 LinkedList에서 찾아보자.**

**First to the last** 까지 검사한다.

- No difference in the search pattern (기본 Array와 다른점이 없음)
- index를 사용한 쉬운 접근은 불가하다.
- Linked list에 있는 Next를 사용한다.

방법

1. Find Head from the list
2. Find Next node
   - if Next==tail 이면 반복문을 break
   - if Next==tail 이 아니면 next.nextNode로 이동한다.



array와 마찬가지로 **N번 검사를 해야지 내가 찾는 element가 있는지 없는지 알 수 있다.**



---

### Insert procedure in singly linked list

 Insert operation이 Linked list의 Power를 볼 수 있다. 기존 Array에 경우에는 크기가 커지면 커질수록 retrievals이 많이 필요했다. 하지만 Linked list는 **3개의 operation**만 필요하다.

- With an assumption that you have a reference to the node, Node prev that you want to put your new node next(**어떤 노드 뒤에 넣고싶은지는 알고 있다라고 가정**)
- 먼저 Node prev가 가리키고 있는 Node나 Node next를 store함.
- Node prev의 nodeNext reference를 Node new로 바꾼다.
- Node new의 nodeNext reference를 Node next로 바꾼다.

**나머지의 reference 구조는 바뀐게 없지만, insert하는 Node의 앞뒤 Node의 reference구조만 바꾸면 된다!**



---

### Delete procedure in singly linked list

ex) 'd'라는 것을 없앤다고 했을 때, 아까와 마찬가지로 Node_prev는 알고 있다고 가정! 아까는 Node를 하나 새로 넣어야하니까 Instantiation 했는데, Delete는 그럴필요 없고, 다음의 순서를 따른다.

1. 삭제할 Node는 NodePrev.next 이고, NodeNext = NodePrev.next.next 이다
2. Reference를 Node_prev의 node_Next가 Node next를 가리키도록 바꾼다. (NodePrev.Next = NodeNext)

'd'가 사실상 없어지는것처럼 보인다. 하지만 실제로는 'd'를 찾아갈 reference가 없어서 찾아갈 방법이 없어지는 것이다. 

이렇게 된 Instance는 **Garbage collector**에 의해서  접근할 방법이 없는 instance를 메모리 상에서 없애버린다.



---

### Implementation of Singly linked list

```python
class SinglyLinkedList:
    nodeHead = ''
    nodeTail = ''
    size = 0
    def __init__(self):
        self.nodeTail = Node(binTail = True)
        self.nodeHead = Node(binHead = True)
      
    def insertAt(self, objInsert, idxInsert):
        nodeNew = Node(objValue = objInsert)
        nodePrev = self.get(idxInsert-1)
        nodeNext = nodePrev.getNext()
        nodePrev.setNext(nodeNew)
        nodeNew.setNext(nodeNext)
        self.size = self.size + 1
        
        
    def removeAt(self, idxRemove):
        nodePrev = self.get(idxRemove-1)
        nodeRemove = nodePrev.getNext()
        nodeNext = nodeRemove.getNext()
        nodePrev.setNext(nodeNext)
        self.size = self.size - 1
        return nodeRemove.getValue()
    
    def get(self. idxRetrieve):
        nodeReturn = self.nodeHead
        for itr in range(idxRetrieve + 1):
            nodeReturn = nodeReturn.getNext()
        return nodeReturn
    
    def printStatus(self):
        nodeCurrent = self.nodeHead
        while(nodeCurrent.getNext().isTail()==False):
            nodeCurrent = nodeCurrent.getNext()
            print(nodeCurrent.getValue())
        
    def getSize(self):
        return self.size
    
    
list1 = SinglyLinkedList()
list1.insertAt('a', 0)
list1.insertAt('b', 1)
list1.insertAt('d', 2)
list1.insertAt('e', 3)
list1.insertAt('f', 4)
list1.printStatus()

list1.insertAt('c', 2)
list1.printStatus()

list1.removeAt(3)
list1.printStatus()

```



----

## Stack and Queue

Linked list를 활용해서 구현할 수 있는 추가적인 자료구조다.

   

---

### Scenario for Stack

내리는 곳이 다른 여러명의 사람들이 같이 오른쪽으로만 내릴 수 있는 택시를 타고 간다고 할 때, 누가 먼저 내려야할지 안다면 택시에 탈 때 부터 미리 순서에 맞게 탈 것 이다.이렇게 데이터를 넣고 뺄 수있는 위치가 하나로 고정되어있고  **처음 들어온 데이터가 가장 나중에 처리되는 데이터 구조를 Data structure를 Stack이라고 한다.**

- Last In First Out (LIFO)

----

### Structure of Stack

**Stack은 Linked list와 동일하게 linear하다.** 어떤면에서 보면 Stack이라는것은 singly linked list의 variation이라고 봐도 된다. 하지만 Stack에서는 `insert` op는 없다.

Difference

- Voluntarily giving up
  - 중간에 데이터들은 관리 안하겠다.
  - 오로지 첫번째 노드만 이용해서접근하겠다. (Top Node)
- The first instance in the list = The top instance in the stack

An item is inserted or removed from the stack from one end called the 'Top' of the stack.

**Stack의 이런 Mechanism을 Last-In-First-Out(LIFO)라고 한다.**



---

### Operation of Stack

Top에서만 Operation하고, 중간영역에는 Access할 수 없다.

Stack operation

- Push
  - **Insert** an instance **at the first**
  - Put an instance at the top 
- Pop
  - **Remove** and return an instance **at the first**
  - Remove and return an instance at the top



Push와 Pop은 insert와 remove를 가지고 구현이 가능하다.



---

### Implementation of Stack

```python
Class Stack(object):
    lstInstance = SinglyLinkedList()
    def pop(self):
        return self.lstInstance.removeAt(0)
    def push(self, value):
        return self.lstInstance.insertAt(value,0)
```

**첫번째 위치의 것만을 access한다는 점을 이용해서 손쉽게 push와 pop을 만들 수 있다.**



----

### Example: Balancing Symbols

Balancing symbols?

-> 프로그램에서 중괄호,소괄호,대괄호가 제대로 잘열리고 잘 닫힌 경우를 의미한다.

Balancing symbols case가 아니라면? 오류가 뜨거나, 내가 원하는 Output을 얻을 수 없다.



**Algorithm for the balanced symbol checking**

- Make empty stack (빈 Stack을 만든다.)
- Read symbols until end of formula (닫는 Symbol이 나올 때 까지 계속 Symbol을 읽는다.)
  - Opening symbol 이면 무조건 stack에 push한다.
  - Closing symbol 일 때
    - 만약 stack이 empty다(매치가 되는 opening symbol이 없다?) 
    
      -> Error
    
    - symbol의 style이 맞지 않는다? 
    
      -> Error
  - 에러가 리포트 안되고, Stack이 empty면 Balancing Symbol 이다.



---

### Scenario of Queue

공항에 표를 사기위해 사람들이 줄을 서 있다. 줄은 당연히 맨 뒤쪽으로 계속 서야하고, 맨처음 선 사람이 부터 순서대로 표를 산다. in way와 out way가 다르고, No one gets in the middle of the line. (중간으로 들어올 수 없다.)

이처럼 **먼저 들어온 데이터부터 처리되서 나가는 구조를 바로 Queue라고 한다.**

- First in First out (FIFO)



----

### Structure of Queue

중간으로는 못들어오고, 들어오는 길은 맨 뒤쪽고, 나가는 길은 맨 앞쪽

Difference

- The first instance in the list
  - The front instance in the queue
- The last instance in the list
  - The rear instance in the queue



An item is inserted at the last

An item is removed at the front



---

### Operation of Queue

Stack과 마찬가지로 **중간단계 access를 포기했기 때문에**,  List의 특정 index에 대해서 잘 처리해주면, List를 활용해서 Queue를 구현할 수 있다.

Enqueue

- Insert an instance at the last in the linked list(맨 뒷부분에 insert)

  -> Put an instance at the rear in the queue

Dequeue

- Remove and return an instance at the first in the linked list(맨 앞부분에 것을 remove)

  -> Remove and return an instance at the front in the queue



---

### Implementation of Queue

```python
Class Queue(object):
    lstInstance = SinglyLinkedList()
    def dequeue(self):
        return self.lstInstance.removeAt(0)
    def enqueue(self, Value):
        self.lstInstance.insertAt(Value, self.lstInstance.getSize())
        
```

enqueue같은것은 사이즈 변화를 신경써야함.

그래서 LinkedList class에 있는 getSize 함수를 이용해서 

queue의 맨 뒤쪽 index를 명시해줌



---

## Implement Linked List again(This time, with UML Class Diagram)

하도 중요하다고 하니까, 인터넷에 떠도는 UML Diagram보고 한번 만들어보자.

<img src="/images/LinkedList/UML.jpeg" width="800px" height="300px" align="center">  

 

```python
class Node:
    def __init__(self, data=None):
        self.data = data
        self.next = None
```

Node Class의 member function은 작성하지 않았음

```python
class LinkedList:
    def __init__(self):
        self.head = Node()
    def addFront(self, data):
        newNode = Node(data)
        curNode = self.head
        newNode.next = curNode.next
        curNode.next = newNode
    def addEnd(self, data):
        newNode = Node(data)
        curNode = self.head
        while curNode.next != None:
            curNode = curNode.next
        curNode.next = newNode
        
    def length(self):
        curNode = self.head
        count = 0
        while curNode.next != None:
            curNode = curNode.next
            count += 1
        return count
    def addAtPosition(self, data, idx):
        newNode = Node(data)
        curNode = self.head
        curIndex = 0
        while curIndex != idx:
            curIndex += 1
            curNode = curNode.next
    def search(self, data):
        curNode = self.head.next
        idx = 0
        while curNode.data != data:
            curNode = curNode.next
            idx += 1
        return idx
    def printItem(self):
        list = []
        curNode = self.head
        while curNode.next != None:
            list.append(curNode.next.data)
            curNode = curNode.next
        return list
    def deleteFront(self):
        curNode = self.head
        target = curNode.next
        curNode.next = target.next
    def deleteEnd(self):
        curNode = self.head
        while curNode.next.next != None:
            curNode = curNode.next
        curNode.next = None
    def deletePosition(self, idx):
        curIndex = 0
        curNode = self.head
        while True:
            lastNode = curNode
            curNode = curNode.next
            if curIndex == idx:
                lastNode.next = curNode.next
                return
            curIndex += 1
    def getItem(self, idx):
        curIndex = 0
        curNode = self.head
        while curIndex != idx:
            curNode = cur.next
            curIndex += 1
        return curNode.next.data
```

```python
test = LinkedList()
test.addEnd('a')
test.addEnd('b')
test.addEnd('c')
test.printItem()
test.deletePosition(1)
test.printItem()
test.getItem(0)
test.search('a')
```





## 현장강의

