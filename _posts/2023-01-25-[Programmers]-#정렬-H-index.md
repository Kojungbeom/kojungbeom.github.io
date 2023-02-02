---
title: Programmers-H-index
author: EUNJI KWAK
date: 2023-1-25
categories: [Programmers, EUNJI_P]
tags: [sorting, sort, 정렬]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/42747)

### **문제 설명**

H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과[1](https://school.programmers.co.kr/learn/courses/30/lessons/42747#fn1)에 따르면, H-Index는 다음과 같이 구합니다.

어떤 과학자가 발표한 논문 `n`편 중, `h`번 이상 인용된 논문이 `h`편 이상이고 나머지 논문이 h번 이하 인용되었다면 `h`의 최댓값이 이 과학자의 H-Index입니다.

어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.

### 제한사항

- 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
- 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.

### 입출력 예

| citations | return |
| --- | --- |
| [3, 0, 6, 1, 5] | 3 |

### 입출력 예 설명

이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다.

# [풀이]

**Flow**

** h-index는 논문의 수보다 클 수 가 없다 !!**

return값 목표: h를 차례로 증가시키면서 -> 인용된 논문의 횟수가 h번 이상인 논문의 개수 > h -> h중에서 max를 찾아라 !

count = 0, answer = 0

1. citations를 sorting한다. [3,0,6,1,5] -> [0,1,3,5,6]

2. for문 시작 range(0, max(citations)) ; for h in range(0, max(citations))

3. 중첩 for문 시작 range(len(citations)) ; for i in range(len(citations))

4. if citations[i] >=  h:  -> count += 1

5. for문 빠져나와서 if count >= h:  answer = h

6. count 초기화

7. 2~6번까지 반복

```python
def solution(citations):
    answer = 0
    h, count = 0, 0
    citations.sort()
    for h in range(len(citations)+1):
        for i in range(len(citations)):
            if h <= citations[i]:
                count += 1
        if count >= h:
            answer = h
        count = 0
        print(answer)
    return answer
```

- 시간복잡도:O(N^2) <<<< 최악임

### 다른 사람 풀이

```python
def solution(citations):
    answer = 0
    citations = sorted(citations)
    for h in range(len(citations)):
            if citations[h] >= len(citations) - h:
							answer = len(citations) - h
							return answer
    return 0
```

- count 연산을 줄임 !
- 규칙을 발견했어야 함
