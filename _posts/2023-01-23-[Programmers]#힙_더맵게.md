# [Programmers]#힙_더맵게

---
title: Programmers - 더맵게
author: EUNJI KWAK
date: 2023-1-23
categories: [Programmers, EUNJI_p]
tags: [Heap, 힙]
---

# [문제]([https://school.programmers.co.kr/learn/courses/30/lessons/42626](https://school.programmers.co.kr/learn/courses/30/lessons/42626))

매운 것을 좋아하는 Leo는 모든 음식의 스코빌 지수를 K 이상으로 만들고 싶습니다. 모든 음식의 스코빌 지수를 K 이상으로 만들기 위해 Leo는 스코빌 지수가 가장 낮은 두 개의 음식을 아래와 같이 특별한 방법으로 섞어 새로운 음식을 만듭니다.

`섞은 음식의 스코빌 지수 = 가장 맵지 않은 음식의 스코빌 지수 + (두 번째로 맵지 않은 음식의 스코빌 지수 * 2)`

Leo는 모든 음식의 스코빌 지수가 K 이상이 될 때까지 반복하여 섞습니다.Leo가 가진 음식의 스코빌 지수를 담은 배열 scoville과 원하는 스코빌 지수 K가 주어질 때, 모든 음식의 스코빌 지수를 K 이상으로 만들기 위해 섞어야 하는 최소 횟수를 return 하도록 solution 함수를 작성해주세요.

### 제한 사항

- scoville의 길이는 2 이상 1,000,000 이하입니다.
- K는 0 이상 1,000,000,000 이하입니다.
- scoville의 원소는 각각 0 이상 1,000,000 이하입니다.
- 모든 음식의 스코빌 지수를 K 이상으로 만들 수 없는 경우에는 -1을 return 합니다.

### 입출력 예

| scoville | K | return |
| --- | --- | --- |
| [1, 2, 3, 9, 10, 12] | 7 | 2 |

### 입출력 예 설명

1. 스코빌 지수가 1인 음식과 2인 음식을 섞으면 음식의 스코빌 지수가 아래와 같이 됩니다.새로운 음식의 스코빌 지수 = 1 + (2 * 2) = 5가진 음식의 스코빌 지수 = [5, 3, 9, 10, 12]
2. 스코빌 지수가 3인 음식과 5인 음식을 섞으면 음식의 스코빌 지수가 아래와 같이 됩니다.새로운 음식의 스코빌 지수 = 3 + (5 * 2) = 13가진 음식의 스코빌 지수 = [13, 9, 10, 12]

모든 음식의 스코빌 지수가 7 이상이 되었고 이때 섞은 횟수는 2회입니다.

# [풀이]

1. 무엇을 추가 ? 계산된 스코빌 지수
2. 언제 pop할 것인지 ? 스코빌 지수 계산을 위해 다음 인덱스의 요소를 부를때 

## 힙 구조: **최댓값과 최솟값을 빠르게 찾기 위해 고안된 자료구조**

- 삽입:

```python
heap = [] 
heapq.heappush(heap, 1)
```

- 삭제:

```python
return heapq.heappop(heap)

# 최소값을 꺼내지 않고 리턴만 하려면 인덱스로 접근하기
print(heap[0])
```

```python
import heapq

def solution(scoville, K):
    answer = 0
    scoville.sort()

    while True:
				#힙구조 특성상 heappop()을 쓰면 자동으로 제일 작은값을 반환
        first = heapq.heappop(scoville)
        if first < K:
						#스코빌 지수 힙에 아무것도 없을때 종료
            if not scoville:
                return -1
            second = heapq.heappop(scoville)
            heapq.heappush(scoville, first+(second*2))
            answer += 1
            
        else:
            return answer
```

## 📌주목!

heapq.heappop(list): list 내에서 가장 작은 값을 반환!

### 다른 사람 풀이

```python
import heapq

def solution(scoville, K):
    heapq.heapify(scoville)
    size, cnt = len(scoville) - 1, 0
    f = heapq.heappop(scoville)
    while size > 0:
        s = heapq.heappop(scoville)
        f = heapq.heappushpop(scoville, f + s + s)
        if f >= K:
            return cnt + 1
        cnt += 1
        size -= 1
    return -1
```

- while문의 조건만 조금 변형한 형태 !
- heappushpop(heap, item) : heap에 아이템을 push한 다음 → 가장 작은 항목을 pop하고 반환!
- 굳이 push하고 pop하지 않고, 동시동작으로 처리가능!