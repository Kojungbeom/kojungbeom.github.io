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

$= {n(n-1) \over 2} $ 

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



## Definition of Algorithm Analysis

Analyzing an algorithm is estimating the resources that the algorithm requires.

Algorithm analysis란 알고리즘에 필요한 Resource를 추측하는 것이다.

ex) Memory, Bandwidth, **Computational time**



### Running time에 영향을 주는 요인

- 컴퓨터 성능
- 알고리즘
- Data structure
- Input data size



Algorithm analysis를 하면 이러한 요인들에 따른 Runtime의 Worst-case의 Estimation을 얻을 수 있다. (하지만 이 강의에서는 일단 Algorithm과 Data structure에 집중한다.)

```python
# (intto - intfrom) = N
def calculateSum(intfrom, intto):
    intSum = 0
    for itr in range(intfrom, intto):
        intSum += itr
    return intSum
```

위의 코드에서 각 라인마다 반복되는 횟수를 계산해보자

- Line1: 1 iteration
- Line2~3: (intto-intfrom) iterations, 각 라인당 N번의 iteration
- Line4: 1 iteration

Total 2N+2 iteration(or Execution) 해야하는 Algorithm

-> O(N)이라고 표현한다. (N에 대한 항중에 가장 높은 차항을 찾고, 계수를 Drop하고 O()안에 넣으면 된다. 정확한 정의와 증명은 뒤에서!)



### Bubble sort algorithn analysis

```python
def bbSort(lst):
    for itr1 in range(0, N):
        for itr2 in range(itr+1, N):
            if lst[itr1] > lst[itr2]:
                lst[itr1], lst[itr2] = lst[itr2], lst[itr1]
    return lst
```

아까와 똑같이 각 라인마다 반복되는 횟수를 계산해보자. (함수안쪽에서부터 Line1)

- Line 1: N iteration
- Line 2~4: $ {n(n-1) \over 2} $만큼의 반복이 필요했었다.(위에 참고) 여기에 * 3
  - **우리가 구해야할 것은 Worst-case이기 때문에 항상 if문을 거쳐갈때의 iteration의 수를 구해야 한다.**
- Line 5: 1 iteration

Total  ${3n(n-1) \over 2}$번의 iteration(or Execution) 해야하는 Algorithm

-> $O(N^2)$



## Asymptotic notation: Big-Oh

앞에서 O(N), O($N^2$)는 무슨 의미를 가지고 있을까?

-> Worst-case Running time을 표현을 한 것이다.

수학적인 정의를 해보면, 아래의 상황을 만족하면 $f(N) = O(g(N))$라고 표현할 수 있다. (이때 $f(n)$는 execution해야하는 time을 의미한다.)

- There are positive constants c and $n_0$ such that $f(N) \le  cg(N) when N \ge n_o$

  (Positive constant인 c와 $n_0$를 찾을 수 있으면 위의 식이 성립한다는 뜻이다.)

ex) ${3n(n-1) \over 2} = f(n)$이라고 할 때, $O(N^2)$라고 했었다. 여기서 c는 뭔지 모르겠지만 ,$g(N) = N^2$이었다. $f(N) \le  cg(N)$라는 부등식이 성립하고 있는지 모른다. 다이때 이 부등식에서 전부 오른쪽으로 넘기고 정리하면 $(c-{3 \over 2})n^2 + {3 \over 2}n \ge 0$이 된다. 이 부등식에 성립하는 c와 $n_0$를 찾으면 되는건데, 만약 $c={5 \over 2}, n_0 \ge 0$일때 이 부등식이 성립한다는 것을 확인할 수 있었다. 이때, 다시 $f(N) \le  cg(N)$라는 식을 보면, 이것 또한 성립한다는 뜻이고, 결국 Worst-case에서의 반복의 수는 g(N)이라고 할 수 있는것이다.

- **The growth rate of $f(N)$ is less than or equal to the growth rate of $g(N)$**
- g(N) is an upper bound on $f(N)$



## Growth rate

Growth rate는 값이 증가하는 정도를 의미한다.

The growth rate of $f(N)$ is less than or equal to the growth rate of $g(N)$

Big-Oh notation에서, $f(N)$의 growth rate이 $g(N)$의 growth rate보다 같거나 작았다.





## Example of Big-Oh notation

$f(N) = 7N^2$라고 가정,

- $f(N) = O(N^4)$
- $f(N) = O(N^3)$
- $f(N) = O(N^2)$ (이게 Best answer이고, 이런 경우를 Asymptotically tight라고 한다.)

Overestimation을 할 필요는 없기때문에 Asymptotically tight한걸로 나타내는게 좋다.

다른 여러가지 함수(log함수, 삼각함수)에 대한 Big-Oh notation이 많으니까 확인해봐야한다.



## Rules of Big-Oh notation

Growth rate에 대해서

1. lower order term와  highest-order term의 coefficients(기울기)에 대해서는 무시한다,

- c

2. Log에 대해서는 Base를 굳이 적지 않아도 된다.
3. 여러개의 알고리즘을 연달아 실행 혹은 Nested되서 속에서 곱해지는 경우에는 ~~~
4. 