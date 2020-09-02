# Week7

## Algorithm Analysis

알고리즘을 분석하는 방법에 대해서 알아보자



## Weekly Objectives

This week, we learn how to analyze the efficiency of our program

- Algorithm analysis

•Objectives are

- Memorizing the definition and the rules of the big-Oh notation
- Understanding what determines the efficiency of programs
- Understanding simple algorithms
  - Memorizing the insert and the delete of lists, stacks, and queues
  - Memorizing the bubble sort
- Able to apply the big-Oh notation analysis to programs

얼마나 빠르게 효과적으로 작동하는지에 대해서 분석하기위해 Algorithm analysis를 사용한다.

어떤 Factor가 이런것에 작용하는지 알 필요가 있다.



## Factors of Program's efficiency

ex) Data structure에 뭔가를 추가하는 algorithm

Array기반 List에서는 N번의 반복이 필요했다. BST에서는 logN번의 반복이 필요했다.

이렇게 Data structure의 형태에 따라서도 효율성이 각각 다르다.

효율성의 영향을 주는 요소 2가지

- Algorithm

  - A clearly specified set of simple instruction to be followed to solve a problem

    set of simple instruction만 있으면 무엇이든 알고리즘이라고 할 수 있겠다.

- Data structure

그리고 Program이란 Algorithm + Data structure를 의미한다.





## Bubble Sort Algorithm

Sorting algorithm의 일종이다. Insert, Delete, Search같은 LinkedList의 기본적인 Operation을 가지고있다.

(Merge sort는 Recursion할때 했었습니다.)

- Bubble Sort(list)
  - Nested for loop를 이용해서 구현한다.

```python
import random

N = 10
lst = range(N)
random.shuffle(lst)

def bbSort(lst):
    for itr1 in range(0, N):
        for itr2 in range(itr+1, N):
            if lst[itr1] > lst[itr2]:
                lst[itr1], lst[itr2] = lst[itr2], lst[itr1]
    return lst

print(bbSort(lst))
```

이 'Program'에서 'Algorithm'은 Bubble Sort, 'Data Structure'는 List이다. (Program = Algorithm + Data Structure)

반복문을 보면 itr1은 (0~9), itr2는 매 반복마다 (itr1~9)만큼 반복한다.

이 Program에서의 Total iteration은 9+...+1 = 45이다.

$ = n(n-1) \over 2 $ 

이렇게 프로그램이 주어지면 수학적으로 iteration을 계산할 수 있다.



## 왜 효율성이 중요한가?

- 효율성이 없다면 동작하는 프로그램을 만드는것 만으로는 충분하지 않음
  - 굉장히 큰 데이터를 다루게되면, Running time은 큰 문제가 될 것이다.
  - 또는 유저가 많아지게 되면 그또한 큰 문제가 될 것이다.

상품성의 문제?, 그리고 시스템의 안정성을 위해?

- 그래서 Worst-case scenario를 보장해야한다. (적어도 언제까지 끝날까요?)
  - The worst-case running time of a single transaction
  - The worst-case transaction request numbers of a single day

최악의 날이라고 하더라도 이정도는 될거라고 보장할 수 있어야한다.





