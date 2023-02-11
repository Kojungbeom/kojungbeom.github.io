---
title: Programmers - N으로 표현
author: EUNJI KWAK
date: 2023-2-8
categories: [Programmers, EUNJI_p]
tags: [다이나믹 프로그래밍, DP, Dynamic Programming]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/42895)

### **문제 설명**

아래와 같이 5와 사칙연산만으로 12를 표현할 수 있습니다.

12 = 5 + 5 + (5 / 5) + (5 / 5)12 = 55 / 5 + 5 / 512 = (55 + 5) / 5

5를 사용한 횟수는 각각 6,5,4 입니다. 그리고 이중 가장 작은 경우는 4입니다.이처럼 숫자 N과 number가 주어질 때, N과 사칙연산만 사용해서 표현 할 수 있는 방법 중 N 사용횟수의 최솟값을 return 하도록 solution 함수를 작성하세요.

### 제한사항

- N은 1 이상 9 이하입니다.
- number는 1 이상 32,000 이하입니다.
- 수식에는 괄호와 사칙연산만 가능하며 나누기 연산에서 나머지는 무시합니다.
- 최솟값이 8보다 크면 -1을 return 합니다.

### 입출력 예

| N | number | return |
| --- | --- | --- |
| 5 | 12 | 4 |
| 2 | 11 | 3 |

### 입출력 예 설명

예제 #1문제에 나온 예와 같습니다.

예제 #2`11 = 22 / 2`와 같이 2를 3번만 사용하여 표현할 수 있습니다.

# [풀이]

**FLOW**

1. 열: N을 쓴 횟수 
2. 열을 계속 추가하다가 8이 넘어가면 return -1
3. N=2 → 55, 5+5, 5*5, 5/5, 5-5

N=3 → 555, 55+5, 55-5, 55/5, 55*5, 5+5+5, 5/5/5, 5-5-5, 5*5*5

1. 3부터는 앞서 했던 걸로 조합!

## 📌Dynamic Programming

- 최종 코드

```python
def solution(N, number):
    if number == 1:
        return 1
    dp = []
    for turn in range(1, 9): 
        temp = set()
        temp.add(int(str(N) * turn)) # 이어 붙여서 만드는 경우 넣기
        for i in range(turn - 1): # (1, n-1) 부터 (n-1, 1)까지 사칙연산
            for op1 in dp[i]:
                for op2 in dp[-i - 1]:
                    temp.add(op1 + op2)
                    temp.add(op1 * op2)
                    temp.add(op1 - op2)
                    if op2 != 0:
                        temp.add(op1 / op2)
        # 만든 집합에 number가 처음 나오는지 확인
        if number in temp:
            return turn
        dp.append(temp)
    return -1
```

## 📌주목!

- 동적계획법: 하나의 큰 문제를 여러 개의 작은 문제로 나누어서 그 결과를 저장하여 다시 큰 문제를 해결할 때 사용하는 것
    - Bottom-Up: 반복문 사용(TABLE 채우는 형식)
    - Top-Down: 재귀 사용
