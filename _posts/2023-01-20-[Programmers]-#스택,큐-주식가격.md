---
title: Programmers-주식가격
author: EUNJI KWAK
date: 2023-1-20
categories: [Programmers, EUNJI_P]
tags: [Programmers]
---

# 문제

초 단위로 기록된 주식가격이 담긴 배열 prices가 매개변수로 주어질 때, 가격이 떨어지지 않은 기간은 몇 초인지를 return 하도록 solution 함수를 완성하세요.

### 제한사항

- prices의 각 가격은 1 이상 10,000 이하인 자연수입니다.
- prices의 길이는 2 이상 100,000 이하입니다.

## [입출력 예]

| prices | return |
| --- | --- |
| [1, 2, 3, 2, 3] | [4, 3, 1, 1, 0] |

### 입출력 예 설명

- 1초 시점의 1은 끝까지 가격이 떨어지지 않았습니다.
- 2초 시점의 2은 끝까지 가격이 떨어지지 않았습니다.
- 3초 시점의 3은 1초뒤에 가격이 떨어집니다. 따라서 1초간 가격이 떨어지지 않은 것으로 봅니다.
- 4초 시점의 2은 1초간 가격이 떨어지지 않았습니다.
- 5초 시점의 3은 0초간 가격이 떨어지지 않았습니다

# [풀이]

- 문제 유형: 큐; prices의 첫번째 요소부터 순서대로 꺼내서 비교하고 이에 따라 return되는 answer에 append시키면 되기 때문에 일련의 과정이 first in first out 과정과 어울림
1. prices=[1,2,3,2,3] answer = [], count = 0
2. deque(prices)
3. while deque:
4. deque.popleft -> 1 어디 변수에 저장 -> a = 1
5. for i in range(len(prices)):
6. if a > prices[i] : confirm.append(prices[i]): count +=1
7. for문 끝나면(==자기 앞에 있는 요소들이랑 다 비교하면): answer.append(count)
8. while문은 deque에 더이상 요소가 없으면 끝 !
9. return answer

```python
from collections import deque
def solution(prices):
    answer = []
    q = deque(prices)
    while q:
        a = q.popleft()
        count = 0
        for p in q:
            if a > p:
                count += 1
                break
            count += 1

        answer.append(count)
        
    return answer
```

🚨deque를 활용할 시 시간 복잡도가 O(n^2)이 되기 때문에 stack을 사용하는 법이 더 적절 !

## ✔️stack을 사용한 풀이

```python
def solution(prices):
    stack = []
    answer = [0] * len(prices)
    for i in range(len(prices)):
        if stack != []:
            while stack != [] and stack[-1][1] > prices[i]:
                past, _ = stack.pop()
                answer[past] = i - past
        stack.append([i, prices[i]])
    for i, s in stack:
        answer[i] = len(prices) - 1 - i
    return answer
```

### 다른 사람 풀이

```python
def solution(prices):
    answer = [0] * len(prices)
    for i in range(len(prices)):
        for j in range(i+1, len(prices)):
            if prices[i] <= prices[j]:
                answer[i] += 1
            else:
                answer[i] += 1
                break
    return answer
```

1. for문 2개나 써서 구구단처럼 prices 내에서 i번째 요소와 (i+1)번째 요소를 비교!
