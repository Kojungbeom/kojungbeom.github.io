---
title: LeetCode - 739. Daily-Temperatures
author: EUNJI KWAK
date: 2022-12-28
category: Jekyll
layout: post
---

# [문제]

Given an array of integers `temperatures`represents the daily temperatures, return *an array*
 `answer` *such that* `answer[i]`*is the number of days you have to wait after the* `ith`
 *day to get a warmer temperature*
. If there is no future day for which this is possible, keep `answer[i] == 0`
 instead.

[문제 해석] 

array형태로 주어진 온도를 보고, i번째 기온보다 높은 기온이 나올때까지 걸리는 day의 수를 array로 형태로 저장하여 반환하시오.

## example 1:

```
Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]
```

## example 2:

```
Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]
```

## example 3:

```
Input: temperatures = [30,60,90]
Output: [1,1,0]
```

## 제한조건

- `1 <= temperatures.length <= 105`
- `30 <= temperatures[i] <= 100`

# [풀이]

leetcode의 문제 특성 상 자료구조를 활용하여 푸는 것이 훨씬 메모리를 덜 차지하고 가장 효율적인 풀이이다!

input: temperature array

output: 자신보다 높은 기온이 나오는 날까지 걸리는 day array

```python
'''
for문 반복 → temperatures 만큼
	1. temp에 idx 부여
	2. stack에 idx 삽입
	3. if len(stack) > 0 or 자신이 stack에 저장되어 있는 것보다 클 때 → idx pop
	4. pop함과 동시에 answer에 day 차이 갱신
	5. answer를 return
'''
```

### 1. temperature에 day lablel 부여

→ input의 값은 temperature이지만 output은 온도가 아니라! 해당 기온의 day이기 때문에 input에 day 정보를 집어넣기

```python
#temperatures: List[int] 
#stack: append 할 list
stack = []
for idx, temp in enumerate(temperatures):
	stack.append((idx, temp))
```

[output]

```python
input: [30, 60, 90]
output: [(0, 30), (1, 60), (2, 90)]
```

### 2. stack 만들기

** 중요 **

1. stack에 무엇을 집어넣을것인가

→ output으로 day를 반환하기 때문에 idx 저장

1. stack 요소를 언제 pop할 것인가

→ stack에 요소가 있고 && 최근 temp(for문의 idx)와 이전 temp 비교(stack에 저장된 idx를 통해)

```python
class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
			stack = []
			answer = [0] * len(temperatures)

			for idx, temp in enumerate(temperatures):
				while stack and temp > temperatures[stack[-1]]:
					#more..
				stack.append(idx)
		
			return answer
```

### 3.  return 할 answer 요소 집어넣기

output에 day 차이 저장

```python
class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
			stack = [] #day 저장
			answer = [0] * len(temperatures) #answer = [0, 0, 0]

			for idx, temp in enumerate(temperatures):
				#1. (0, 30), stack = [] 
				#3. stack = [0]
				while stack and temp > temperatures[stack[-1]]: #4. temp = 60, temp[stack[-1] = 30
					last = stack.pop() #5. last = 0
					answer[last] = idx - last #6. answer = [1, 0, 0]
				stack.append(idx) #2. stack[0] 7. stack[0, 1]
			
			return answer
				
```

# [배운점]

1. stack =First IN First OUT
2. 무엇을 append, pop, 몇 번 반복하는지 확실히 할 것!
