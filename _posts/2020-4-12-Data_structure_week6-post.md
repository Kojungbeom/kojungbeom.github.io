---
title:  "Data Structure week6"
excerpt: "문일철 교수님의 데이터 구조 및 분석: Linear Structure and Dynamic Programming edwith 강의를 보고 정리한 내용입니다."
date: 2020-4-12 12:00:00
categories:
  - Data Structure
tags:
  - Data Structure
  - Tree
  - BST
lastmod : 2020-4-12 12:00:00
sitemap :
changefreq : daily
priority : 1.0

---



---

# Data Structure Week 6

KAIST 산업및시스템공학과 문일철 교수님의

[데이터 구조 및 분석: Linear Structure and Dynamic Programming](https://www.edwith.org/datastructure-2019s/joinLectures/21992)

[edwith](https://www.edwith.org/) 강의를 보고 정리한 내용입니다.



## Weekly Objectives

This week, we study the tree data structure. Particularly, we will focus on the structure and the operation of the binary search tree.

Objectives are

- Memorizing the definitions, the terminologies and the characteristics of trees
- Understanding the structures of trees 
- Understanding the structure and the operations of a binary search tree
  - Insert, search, delete operations
  - Tree traversing operations
    - Depth first search
      - In-order, post-order, pre-order sequences
    - Breadth first search
    - Level order search

- Understanding the performance of binary search tree



Tree Structure 중에서 BST (Binary Search Tree)에 대해 배웁니다.



---

## Detour: Abstract Data Types

An ADT specifies:

- Data stored
- Operation
- Error response

*(3주차에서 다뤘었습니다.)*



사실 Tree도 일종의 ADT이다.

upside down 형태의 ADT (마치 나무가 거꾸로 된 형태)



Tree

- 일종의 ADT다.

- Data가 tree structure로 저장되어 있다

- operations

  - 기본적인 Data structure라면 지원하는 OP들은 다 지원한다. (ex) LinkedList의 insert, delete, search

  - Special searching approaches for trees and networks

    -> 일직선의 구조가 아니기때문에 다양한 traverse가 정의된다.



---

## Why do we use trees

현실의 Tree Structure Example

- 조직도
- Group bank accounts
- Command



**Tree structure는 왜 쓰는가?**

- **A clear approach of Divide and Conquer**

- Data의 특성을 반영하여 Divide하고, 저장하는 문제를 풀어나가는 방식이 쓰여진 Structure

- LinkedList같은 Data structure보다 더 적은 retrieval 만으로도 필요한 data를 search할 수 있다.

  (뒤에서 자세히 이야기 합니다.)



Recursion도 마찬가지로 Divide and Conquer방식으로 Top-down으로 문제를 줄여나갔었다.

Tree structure를 다룰때도 Recursion를 많이 활용하게 될 것이다.



## Structure of stored data

Linked List같은 경우는 object + Next를 가진 하나의 Node로 표현해서 사용했었다.

- object가 가진 value에 대한 reference

- 다음 노드를 가리키는 reference



이런 LinkedList를 세로로 세웠다고 생각해보자.

Tree구조와 유사하지만 다른점이 있다.

Tree구조에서 네모하나를 Node(tree node)라고 할 때,

LinkedList같은 경우, Next는 하나밖에 없었는데, **Tree structure의 경우 Next가 여러개이다.**

- Each node has multiple next nodes
- Particularly, this structure maintains the next "nodes" as an array or variables



Tree Structure는 점점 커지게 되고, 그에 따라서 데이터를 저장할 공간이 점점 커지게 되는 것

문제는 Next가 여러개이기 때문에, 여러 Next중에 어떤 Next를 선택해야할지가 햇갈릴 수 있는데, 

그런것에 대한 룰을 잘 세우는것이 Tree를 관리하는 기법이 됨



---

## Terminologies of tress structure

- **Edge**
  
  - 하나의 Next reference를 Edge (화살표)
- **Node**
  
  - 하나의 Next reference가 가리키는 것, object하나와 4개의 reference를 가지고 있는 Instance
- **Root**
  
  - 맨 위에 있는 Node (마치 LinkedList의 head)
- **Parent and Child**
  
  - 두개의 Node가 edge로 연결되어 있을 때, 상위 Level의 Node가 Parent
  - **하위 Level의 Node가 Child**
- **Siblings**
  
  - 같은 Level에 있는 (동일한 parent를 가진) Node
- **Terminal Node and Internal Node**
  
  - Terminal Node는 Child가 없는 노드
  - Internal Node는 Terminal Node의 반대
- **Descendants and Ancestors** 
  
  - Node A의 Child, Child의 Child같이 Node A와 연결된 모든 하위 Level의 Node를 지칭한다.
  - parent를 따라가다보면 A를 만나게 된다.
- Ancestors는 Descendant의 반대, 조상님을 의미
  
- **Path to E**

  - 매우 중요한 path개념
  - Root위치에서 특정 Node까지 edge를 통해 갈 수 있는 최단거리의 길을 path라고 한다.

- **Depth and Level of B**

  - B라는 노드에 대한 path는 1이 된다. -> B의 Depth는 1이다.
  - Depth = Path length

- **Height of tree**

  - Maximum path length = Height of tree

- **Degree of B Node**

  - 특정노드의 Degree는 B가 가질 수 있는 Child의 수

- **Size of tree**

  - Tree에 있는 Node의 개수 (저장되어있는 데이터의 개수)

- **Full Tree**

  - Leaf가 모두 동일레벨
  - Internal Node에는 모든 Next들이 fully하게 다음 Node를 가리키고 있음
  - 삼각형 모양

- **Complete Tree**

  - 바로 직전 Depth까지는 full tree structure인데, 맨 왼쪽부터 하나하나 채워나가는 과정 (순서대로)중이면 Complete tree (Filled from left)

  

## Characteristics of trees

- **Num of edges =  (Num of nodes) - 1** 
- **Depth of root = 0**
- **Height of root = height of tree = Maximum path length**
- **Maximum num of nodes at level i with degree d**
  - $d^i$
- **Maximum num of leaves with height h and degree d**
  - $d^h$
- **Maximum size of a tree with height h and degree d**
  - $= d^0 + d^1 + d^2 + .. + d^h = d^(h+1) -1 / (d-1)$
- **Height of a complete tree with size s and degree d**
  - 위의 식을 LOG로 바꿔서 전개
  - log는 실수형, Height는 정수형이라서 올림을 해줌



---

## Binary Search Tree (BST)

 Binary tree = Degree가 2인 Tree

Binary "search" tree

- Degree가 2인 tree
- 저장된 데이터에 대해서 빠르게 search가 가능하게 디자인되었다.
- 빠르게 search가 가능하도 데이터의 특성을 활용해서 구조를 만들어야한다.



ex) 건물에서 화장실을 찾으려고 함

화장실을 찾아가려면 어떻게해야할까?

- 직원에게 물어보기
- 무작정 걷기
- Sign을 찾기
- 짐작해서 찾아보기 (Guess)

보통 4번째으로도 화장실을 찾을 수 있는 이유는?

-> 건물의 설계에는 일정한 패턴을 가지고 있기 때문 (귀퉁이에 있다던지, 엘리베이터 옆에 있다던지)

-그래서 1,2,3을 하지 않아도 짐작으로 화장실을 찾아갈 수 있는데

이런식으로 데이터도 **일정한 패턴을 가지도록 만든다면, 빠른 search가 가능하다.**



### A scenario of using binary search tree

1001부터 시작되는 Account ID에서 1004를 찾는다고 할때

LinkedList라면 1001부터 4번의 retrieval을 해서 1004를 찾아가야함



binary search tree는 2개의 Next가 있는데

왼쪽에는 더 작은값을 저장하고, 오른쪽에는 더 큰 값을 저장한다.

**이런 방식으로 했을 때에 규칙이 있기때문에 더 적은 retrieval만으로도 원하는 데이터를 찾을 수가 있다.**



### Implementation of Tree Node

먼저 Tree의 Node를 만들어야 함



**Member Variable**

- Left hand side node
  - Lower than its own value
- Right hand side node
  - higher than its own value
- parent node
- value

-> 4개의 reference를 가진다.



**Member function**

- simple get/set methods (encapsulation)



```python
class TreeNode:
    # Member variable
    nodeLHS = ''
    nodeRHS = ''
    nodeParent = ''
    value = ''
    def __init__(self, value, nodeParent):
    	self.value = value
    	self.nodeParent = nodePraent
    # Simple get methods
    def getValue(self):
        return self.value
    def getParent(self):
        return self.nodeParent
    def getLHS(self):
        return self.nodeLHS
    def getRHS(self):
        return self.nodeRHS
    # Simple set methods
    def setValue(self,value)
    	self.value = value
    def setParent(self, nodeParent):
        self.nodeParent = nodeParent
    def setLHS(self, nodeLHS):
        self.nodeLHS = nodeLHS
    def setRHS(self, nodeRHS):
        self.nodeRHS = nodeRHS
```



---

### Implementation of BST

**Member Variable**

- root에 대한 reference만 가지고 있다.



**Member function**

- insert
- search
- delete
- findmax
- findmin
- traverselevelnorder
- traverseInorder
- traversepreOrder
- traversePostOrder



---

#### Insert operation of binary search tree

어떻게 규칙을 지켜가며 LHS, RHS에 정확하게 data를 저장할 수 있을까?

- 기본적으로 Recursion을 사용한다.

insert할 떄 특정한 Node or Root를 받아오게 됨

**Case 1. root가 비어있다.** 

- root에 그 데이터를 저장한다.

**Case 2. 이미 insert하려고하는값이 저장되있다.** 

- 중복된 insert는 안하고 return

**Case 3. 현재 Node의 value가 저장하려고하는 value보다 작을 경우** (My value < Node's value)

- 현재 Node의 RHS에 저장
  - RHS에 이미 value가 있다면?
    - RHS와 또다시 비교 (반복)
- 현재 Node의 value가 더 크다면?
  - LHS에 저장
  - LHS에 이미 value가 있다면?
    - LHS와 또다시 비교 (반복)

```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
        
    def insert(self, value, node=''):
        # 초기화 구문
        if node == '':
            node = self.root
        # root가 비어있다면, root에 저장한다.    
        if self.root = '':
            # TreeNode(value, nodeParent)
            self.root = TreeNode(value, '')
            return
        # 같은 value가 있다면 insert하지 않고 return한다.
        if value == node.getValue():
            return
        # Value가 현 Node의 value보다 작을 경우
        if value < node.getvalue():
            if node.getLHS() == '':
                node.setLHS(value)
            else:
                # Recursion
                node.insert(value, node.getLHS)
        if value > node.getvalue():
            if node.getRHS() == '':
                node.setRHS(value)
            else:
                # Recursion
                node.insert(value, node.getRHS)
        return
```



---

#### Search operation off binary search tree

Search하려는 value가 있으면 True를 return한다.



찾으려는 value가 그 Node의 Value보다 작다면 (My value < Node's value)

- if there is a node in the right hand side, then move to the RHS node (recursion)
- 더이상 RHS가 없다면 False를 Return

- 다음번에는 LHS로 찾아가야함 (RHS쪽은 생각도 안해도 됨)

value가 Node보다 크다면 (My value > Node's value)

- if there is a node in the left hand-side, then move to the LHS node (recursion)

- RHS로 찾아가야함 (LHS쪽은 생각도 안해도 됨)
- 더이상 LHS가 없다면 False를 Return



찾을 영역이 계속해서 줄어든다. 

-> Recursion을 이용해서 서서히 찾아간다.

LinkedList같은 경우는 Chain을 계속 따라가서 찾아야함 (n개가 있다면 n개를 다 봐야함)

Tree구조는 그럴 필요없이 Height만큼 or Depth만큼만 찾아보면 된다.

-> LinkedList에 비해 상대적으로 Search 성능이 더 좋다.



```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
    
    def search(self, value, node=''):
        # 초기화 구문
        if node == '':
            node = self.root
        # Value와 같다면 True를 return, escape routine
        if value == node.getValue():
            return True
        # Value가 현 Node의 value보다 작다면 LHS에서 search, LHS가 없다면 False를 return
        # Recursion
        if value < node.getValue():
            if node.getLHS() = '':
                return False
            else:
            	return search(value, node.getLHS())
        # Value가 현 Node의 value보다 크다면 RHS에서 search, RHS가 없다면 False를 return
        # Recursion
        if value > node.getValue():
            if node.getRHS() = '':
                return False
            else:
            	return search(value, node.getRHS())
```



---

#### Delete operation of binary search tree

Tree structure에서 Delete는 매우 복잡하다.

- 값을 삭제한 후에 트리에 생기는 여파가 크기 때문이다.

Node를 하나 없애는 것인데, 

Node가 Child가 없는 Node라면 딱히 복잡하지 않다.

그러나 Child가 하나라도 있다면 복잡해진다. (child는 그대로두고, parent node만 없애야하기 때문)



**Three Deletion Case**

- **Deleting a node with no children**

  - 그다지 어렵지 않음. parent node로 가서 reference만 끊어주면 됨

- **Deleting a node with one child**

  - Replace the node with the child. Child가 parent node의 자리를 대체하면 됨

- **Deleting a node with two children**

  - 해법들의 concept은 어떤 node를 그 자리에 올리는 것이다.

  - child Node를 올리면 규칙을 위반할 수도 있기 때문에, 

    지우려는 value에 가장 가까운 Node를 찾아야 한다.

  - Find either

    - A maximum in the LHS or A minimum in the RHS (중간에 가까운걸 찾는 두가지 방식)

    - substitute the node to delete with the found value

    - Delete the found node in the LHS or the RHS
  
      

Tree structure는 그대로 둔 상태에서 **가장 가까운 Node**를 그 자리에 copy한다.

**이때 이 노드는 반복적으로 RHS면 RHS, LHS면 LHS을 지속적으로 추적하다가,** 

**더이상 LHS나 RHS가 없을 때의 Node를 가져온 것이기 때문에 Child가 많아봤자 1개이다.**

앞에서 다룬 2가지의 케이스를 적용해서 그 값을 삭제



```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
    
    def delete(self, value, node=''):
        if node == '':
            node = self.root
        if value < node.getValue():
            return self.delete(value, node.getLHS())
        if value > node.getValue():
            return self.delete(value, node.getRHS())
        if value == node.getValue():
            if node.getLHS() != '' and node.getRHS() != '':
                # findMin method는 뒤에서 findMax method와 함께 정의합니다.
                nodeMin = self.findMin(node.getRHS())
                # 그 자리에 가장 가까운 node를 copy
                node.setValue(nodeMin.getValue())
                self.delete(nodeMin.getValue(), node.getRHS())
            	return
            # 지금 이 Node가 Parent의 LHS인지 RHS인지 확인하기 위한 Instance
            parent = node.getParent()
            # 현 node가 RHS는 없고, LHS만 있을 때 
            if node.getLHS() != '':
                if node == self.root:
                    self.root = node.getLHS()
                # 현 node가 parent의 LHS에 있을 때
                elif node == parent.getLHS():
                    parent.setLHS(node.getLHS())
                    node.getValue().setParent(parent)
                # 현 node가 parent의 RHS에 있을 때
                else:
                    parent.setLHS(node.getLHS())
                    node.getLHS().setParent(parent)
                return
            # 현 node가 LHS는 없고, RHS만 있을 때 
            if node.getRHS() != '':
                if node == self.root:
                    self.root = node.getRHS()
                # 현 node가 parent의 LHS에 있을 때
                elif node == parent.getLHS():
                    parent.setLHS(node.getLHS())
                    node.getValue().setParent(parent)
                # 현 node가 parent의 RHS에 있을 때
                else:
                    parent.setLHS(node.getLHS())
                    node.getLHS().setParent(parent)
                return
            # 현 node가 LHS도 없고, RHS도 없는 경우
            if node == self.root:
                self.root = ''
            elif parent.getLHS() == node:
                parent.getLHS() = ''
            else parent.getRHS() == node:
                parent.getRHS() = ''
            return
```



---

#### Minimum and maximum in Binary search tree

1. Find Minimum
   - 계속 LHS로만 찾아가면 Minimum을 찾을 수 있음
2. Find Maximum
   - 계속 RHS로만 찾아가면 Maximum을 찾을 수 있음

언제까지? 

Recursion을 이용해서 더이상 LHS 또는 RHS가 없을 때까지 찾는다.

```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
    # RHS로만 keep moving하면 최대값을 찾을 수 있다.
    def findMax(self, node=''):
        if node == '':
            node = self.root
        if node.getRHS() = '':
            return node
        return self.findMax(node.getRHS())
    # LHS로만 keep moving하면 최소값을 찾을 수 있다.
    def findMin(self, node=''):
        if node == '':
            node.self.root
        if node.getLHS() == '':
            return node
        return self.findMin(node.getLHS())
    # 언제까지? 더이상 없을 때 까지
```





---

#### Tree traversing

LinkedList, Stack, Queue같은 경우는 선형적인 Data structure

이런 경우 그냥 순서에 따라 출력하면 되는데

Tree같은 경우는 어떤 규칙에 따라서 출력을 해야할까?

Tree

- Complicated than a list
- 데이터 전체를 출력하는 여러가지 방법이 있다.
  - List라면
    - 순서에 따라서 처음부터 끝까지 보여주면 된다.
  - BST라면?
    - 어떤식으로 보여줄지 정해야 한다.
      - LHS
      - RHS
      - The value that you have



##### Depth First Traverse

value, LHS, RHS 이 세가지를 출력할 순서를 정해야 한다. 

Value를 언제 출력하냐에 따라 3가지로 나뉨

1. Pre-order traverse
   - Value를 먼저 출력
   - 순서 : Current, LHS, RHS in **Recursion**
2. In-order traverse
   - LHS와 RHS 사이에
   - 순서 : LHS, Current, RHS in **Recursion**
   - Sorting되어있는 결과와 동일함
3. Post-order traverse
   - LHS와 RHS 뒤에
   - 순서 : LHS, RHS, Current in **Recursion**

일반적으로 LHS를 RHS보다 먼저 출력함 (LHS가 더 작은 값이니까)

Current의 LHS와 RHS에서도 그들의 LHS, RHS에 대해서 똑같은 방법으로 **Recursion**

(smaller scale에서 같은 algorithm으로 처리 -> recursion)



```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
	def traverseInOrder(self, node=''):
    	if node == '':
        	node = self.root
        ret = []
        # Append LHS first
        if node.getLHS != '':
            ret = ret + self.traverseInOrder(node.getLHS)
        # Append current second
        ret.append(node.getValue())
        # Append RHS third
        if node.getRHS() != '':
            ret = ret + self.traverseInOrder(node.getRHS)
        return ret
    def traversePreOrder(self, node=''):
        if node == '':
            node = self.root
        ret = []
        # Append current first
        ret.append(node.getValue())
        # Append LHS second
        if node.getLHS == '':
            ret = ret + self.traversePreOrder(node.getLHS())
        # Append RHS third
        if node.getRHS == '':
            ret = ret + self.traversePreOrder(node.getRHS())
        return ret
     def traversePost(self, node=''):
        if node == '':
            node = self.root
        ret = []
         # Append LHS first
        if node.getLHS == '':
            ret = ret + self.traversePreOrder(node.getLHS())
        # Append RHS second
        if node.getRHS == '':
            ret = ret + self.traversePreOrder(node.getRHS())
        # Append current third
        ret.append(node.getValue())
        return ret
```



---

##### Breadth First Traverse

Recursion는 Stackframe을 사용했었다. (Top-down, LIFO)

하지만 Breadth First traverse는 Queue-based level-order traverse

- Enqueue the root
  - while until queue is empty
  - Print current
  - current의 LHS가 존재한다
    - Enqueue current LHS
  - current의 RHS가 존재한다
    - Enqueue current RHS

```python
class BinarySearchTree:
    root = ''
    def __init__(self, root=''):
        self.root = root
    # Queue를 이용한 traversing 방법
    def traverseLevelOrder(self):
        ret = []
        Q = Queue()
        Q.enqueue(self.root)
        # Queue가 비워질 때까지 반복
        # Dequeue되는 Node의 LHS,RHS를 거치면서 없을 때 까지 반복한다.
        while(Q.isEmpty() == False):
            node = Q.dequeue()
            if node = '':
                continue
            # Append current first
            ret.append(node.getValue())
            # LHS가 있으면 Append
            if node.getLHS() != '':
                Q.enqueue(node.getLHS())
            # RHS가 있으면 Append
            if node.getRHS() != '':
                Q.enqueue(node.getRHS())
        return ret
```



---

### Performance of Binary Search Tree

장점

- 규칙에 따라 데이터를 저장함으로써 검사를 안해도 되는 영역이 넓어진다.

하지만 Depth height만 높은 Tree는 이런 장점이 사라지게 된다.